# ⚙️ Detail Fitur

## 1. Keranjang Belanja (Session-Based Cart)

### Konsep

Cart disimpan di PHP session (driver: database), **BUKAN** di tabel database terpisah. Pelanggan tidak perlu login.

### Struktur Data Session

```php
session('cart') = [
    '5' => [                    // key = product_id (string)
        'product_id' => 5,
        'name' => 'Beras Premium 5kg',
        'price' => 75000,
        'image' => 'products/abc.jpg',
        'quantity' => 2,
        'stock' => 50,          // snapshot stok saat ditambahkan
    ],
    '12' => [ ... ],
];
```

### Alur Cart

```
1. Add to cart
   ├── Validate product_id exists + quantity ≥ 1
   ├── Cek produk aktif + stok > 0
   ├── Jika sudah ada di cart → tambah quantity (cek tidak melebihi stok)
   ├── Jika belum ada → tambah entry baru
   └── Simpan ke session

2. Update quantity
   ├── Cek stok terbaru dari database
   ├── Update quantity di session
   └── Redirect back

3. Remove item → unset dari array session
4. Clear cart → session()->forget('cart')
```

### Helper Functions

```php
cart_count()  // Total semua quantity (bukan jumlah item unik)
cart_total()  // Sum(price × quantity) untuk semua item
```

### Catatan Penting

- Stok dicek ulang saat `add` dan `update`, tapi snapshot `stock` di session bisa stale
- Stok di-validate ulang saat checkout (sebelum create order)
- Cart hilang jika session expired (sesuai `SESSION_LIFETIME` di `.env`, default 120 menit)

---

## 2. Checkout & Pembuatan Order

### Alur Checkout

```
1. GET /checkout (CheckoutController@index)
   ├── Cek cart tidak kosong, redirect jika kosong
   ├── Ambil shipping services aktif
   └── Tampilkan form + order summary

2. POST /checkout (CheckoutController@store)
   ├── Validate input (nama, telepon, alamat, shipping_service_id)
   ├── Re-validate stok semua item di cart
   ├── Hitung subtotal + total (subtotal + shipping cost)
   ├── Ambil payment_deadline_hours dari settings
   │
   ├── DB::beginTransaction()
   │   ├── Order::create()
   │   │   ├── order_number = Order::generateOrderNumber()
   │   │   ├── status = 'pending_payment'
   │   │   ├── payment_deadline = now()->addHours($deadlineHours)
   │   │   ├── shipping_service_name + shipping_cost (snapshot)
   │   │   └── subtotal + total_price
   │   │
   │   ├── Loop setiap item di cart:
   │   │   ├── OrderItem::create() dengan product_name + price (snapshot)
   │   │   └── Product::decrement('stock', $quantity)
   │   │
   │   └── DB::commit()
   │
   ├── session()->forget('cart')  // Kosongkan cart
   └── Redirect ke /checkout/success/{order_number}

3. GET /checkout/success/{order_number}
   ├── Ambil order + items
   └── Tampilkan konfirmasi + info bank + countdown
```

### Order Number Format

```
ORD-YYYYMMDD-XXXXX
│   │        │
│   │        └── Sequential 5-digit per hari (00001, 00002, ...)
│   └── Tanggal order (format Ymd)
└── Prefix tetap
```

Contoh: `ORD-20260221-00001`, `ORD-20260221-00002`

### Snapshot Data

Saat checkout, data berikut di-snapshot ke tabel orders/order_items:

- `shipping_service_name` + `shipping_cost` → dari shipping_services
- `product_name` + `price` → dari products

Ini memastikan data pesanan tetap akurat meskipun harga/nama produk berubah di kemudian hari.

---

## 3. Pembayaran Transfer Bank

### Alur

```
1. Pelanggan checkout → Order dibuat dengan status 'pending_payment'
2. Halaman success menampilkan:
   - Nomor pesanan
   - Info bank (dari settings: bank_name, bank_account_number, bank_account_name)
   - Total yang harus dibayar
   - Countdown timer ke payment_deadline
3. Pelanggan transfer ke rekening bank
4. Pelanggan buka /track-order → masukkan order_number + phone
5. Upload bukti pembayaran (foto/screenshot)
   - File disimpan ke storage/app/public/proofs/
   - Kolom payment_proof di orders diupdate
6. Admin cek bukti pembayaran di panel admin
7. Admin ubah status ke 'payment_confirmed'
```

### Validasi Upload

- Tipe file: `image` (jpeg, png, jpg)
- Max size: 2 MB
- Hanya bisa upload jika status `pending_payment` dan belum expired
- Verifikasi customer_phone harus cocok

### Info Bank (dari Settings)

| Setting Key           | Contoh Value       |
| --------------------- | ------------------ |
| `bank_name`           | BCA                |
| `bank_account_number` | 1234567890         |
| `bank_account_name`   | Soeka Mitra Grosir |

---

## 4. Auto-Cancel Pesanan Expired

### Konsep

Pesanan dengan status `pending_payment` yang melewati `payment_deadline` akan otomatis dibatalkan, dan stok produk dikembalikan.

### Artisan Command

**File:** `app/Console/Commands/CancelExpiredOrders.php`
**Signature:** `orders:cancel-expired`

```php
// Logika:
1. Query: orders WHERE status = 'pending_payment'
         AND payment_deadline IS NOT NULL
         AND payment_deadline < NOW()

2. Untuk setiap order expired:
   a. Update status → 'cancelled'
   b. Loop items → product->increment('stock', quantity)
   c. Counter++

3. Output: "Cancelled {count} expired order(s)."
```

### Scheduler

**File:** `routes/console.php`

```php
Schedule::command('orders:cancel-expired')
    ->everyFiveMinutes()
    ->withoutOverlapping()
    ->appendOutputTo(storage_path('logs/scheduler.log'));
```

### Payment Deadline

- Default: 1 jam setelah checkout
- Configurable via admin Settings → `payment_deadline_hours`
- Disimpan sebagai timestamp di kolom `payment_deadline`

### Cron Job (Shared Hosting)

```
*/5 * * * * cd /path/to/project && php artisan schedule:run >> /dev/null 2>&1
```

Lihat [deployment.md](deployment.md) untuk detail setup cron.

---

## 5. Lacak Pesanan (Order Tracking)

### Alur

```
1. GET /track-order → Form input: order_number + customer_phone
2. POST /track-order → Cari order by (order_number + customer_phone)
3. Jika ditemukan → Tampilkan:
   - Status pesanan (badge warna)
   - Data pelanggan
   - Daftar item pesanan
   - Total + ongkir
   - Countdown timer (jika pending_payment)
   - Form upload bukti bayar (jika pending_payment dan belum expired)
   - Preview bukti bayar (jika sudah upload)
4. Jika tidak ditemukan → Error message
```

### Keamanan

- Pesanan hanya bisa dilacak dengan kombinasi **order_number + customer_phone** yang tepat
- Tidak ada cara melihat pesanan orang lain tanpa kedua data tersebut

---

## 6. Manajemen Status Pesanan

### Flow Status

```
pending_payment ──→ payment_confirmed ──→ processing ──→ shipped ──→ completed
       │
       └──→ cancelled (auto atau manual)
```

### Aksi per Status

| Dari              | Ke                | Aksi Otomatis                                     |
| ----------------- | ----------------- | ------------------------------------------------- |
| pending_payment   | cancelled         | Stok dikembalikan (auto-cancel atau manual admin) |
| any               | cancelled         | Stok dikembalikan (manual admin)                  |
| pending_payment   | payment_confirmed | Admin konfirmasi setelah cek bukti bayar          |
| payment_confirmed | processing        | Admin mulai memproses pesanan                     |
| processing        | shipped           | Admin mengirim pesanan                            |
| shipped           | completed         | Admin konfirmasi pesanan selesai                  |

### Pengembalian Stok

Stok produk dikembalikan (`Product::increment('stock', quantity)`) **HANYA** saat status berubah ke `cancelled`:

- Via admin panel (manual)
- Via artisan command `orders:cancel-expired` (otomatis)

---

## 7. Settings System

### Arsitektur

```
Database (settings table)
    ↕ Cache (app_settings, forever)
        ↕ Helper function: setting('key')
```

### Cache Behavior

- `Setting::get()` → Cache::rememberForever('app_settings')
- `Setting::set()` → updateOrCreate + Cache::forget('app_settings')
- Cache di-rebuild otomatis pada `get()` berikutnya setelah `set()`

### Menambah Setting Baru

1. Tambahkan ke `SettingSeeder.php`:
    ```php
    ['key' => 'new_setting', 'value' => 'default', 'type' => 'string', 'group' => 'store', 'label' => 'Label']
    ```
2. Jalankan: `php artisan db:seed --class=SettingSeeder`
3. Gunakan: `setting('new_setting')`

### Tipe Input di Admin

| type                 | Render                  |
| -------------------- | ----------------------- |
| `string`             | `<input type="text">`   |
| `integer` / `number` | `<input type="number">` |
| `textarea`           | `<textarea>`            |

---

## 8. Slider Banner

### Alur

1. Admin upload slider via panel admin (title, subtitle, image, link, sort_order, is_active)
2. Homepage menampilkan slider aktif, diurutkan by sort_order
3. Alpine.js carousel: autoplay 5 detik, prev/next, dot navigation

### Rekomendasi Gambar

- Ukuran: **1200 × 400 piksel**
- Format: JPEG, PNG, JPG, WebP
- Max size: 2 MB

---

## 9. Layanan Pengiriman

### Konsep

Master data layanan pengiriman dikelola admin. Pelanggan pilih saat checkout.

### Saat Checkout

- Hanya layanan dengan `is_active = true` yang ditampilkan
- Diurutkan by `sort_order`
- Biaya ditambahkan ke subtotal → total_price
- Nama + biaya di-snapshot ke tabel orders

### Gratis Ongkir

Jika `cost = 0`, ditampilkan sebagai **"Gratis"** (via accessor `formatted_cost`).
