# 🎨 Views & Frontend

## Layout System

### `layouts/app.blade.php` — Storefront Layout

Digunakan oleh: semua halaman storefront (home, products, cart, checkout, track-order)

**Struktur:**

```
<html>
<head>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    Alpine.js CDN
</head>
<body>
    <header> (sticky)
        Logo + Nama toko
        Nav: Beranda, Produk, Lacak Pesanan
        Cart badge icon (cart_count())
    </header>

    Flash messages (Alpine.js auto-dismiss 4 detik)

    @yield('content')

    <footer>
        Logo + deskripsi toko (dari setting())
        Link navigasi
        Kontak: alamat + telepon (dari setting())
        Copyright
    </footer>
</body>
```

**Data dari helper:**

- `setting('store_name')`, `setting('store_description')`, `setting('store_address')`, `setting('store_phone')`
- `cart_count()` untuk badge keranjang

### `layouts/admin.blade.php` — Admin Layout

Digunakan oleh: semua halaman admin

**Struktur:**

```
<html>
<head>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    Alpine.js CDN
</head>
<body x-data="{ sidebarOpen: true }">
    <aside> (sidebar, dark theme, responsive)
        Logo
        Menu navigasi:
        - Dashboard
        - Produk
        - Kategori
        - Pesanan
        - Pengiriman
        - Slider
        - Pengaturan
        ---
        Logout button
    </aside>

    <main>
        Top bar (hamburger toggle + page title + admin name)
        Flash messages
        @yield('content')
    </main>
</body>
```

**Alpine.js:** `x-data="{ sidebarOpen: true }"` + toggle button untuk responsive sidebar.

---

## Storefront Views

### `home.blade.php`

**Section:** `@extends('layouts.app')`

**Komponen:**

1. **Banner Carousel** — Alpine.js component
    - `x-data="{ current: 0, slides: {{ $banners->count() }}, autoplay: null }"`
    - Membaca gambar statis dari folder `public/banner/`
    - Auto-rotate setiap 5 detik (`setInterval`), hanya jika lebih dari 1 gambar
    - Tombol prev/next + dot indicators (jika lebih dari 1 gambar)
    - Gambar ditampilkan full-width tanpa overlay teks
    - Tinggi banner ditentukan oleh gambar pertama sebagai placeholder (invisible), semua slide di-overlay secara absolute agar container tidak collapse saat berganti slide

2. **Produk Terbaru** — Grid 2/3/4 kolom (responsive)
    - Card produk: image, nama, kategori, harga
    - Tombol "Tambah" (form POST ke `cart.add` dengan quantity=1)
    - Badge "Stok Habis" jika stock ≤ 0

### `products/index.blade.php`

**Data:** `$products` (paginated), `$categories`

**Komponen:**

1. **Search bar** — `<form>` GET ke `products.index` dengan `?search=`
2. **Category dropdown** — `<select>` dengan `onchange="this.form.submit()"`
3. **Product grid** — Sama seperti home (card + add-to-cart)
4. **Pagination** — `{{ $products->links() }}`

### `products/show.blade.php`

**Data:** `$product`, `$relatedProducts`

**Komponen:**

1. **Breadcrumb** — Beranda > Produk > [Nama Produk]
2. **Product detail** — Image besar, nama, kategori, harga, deskripsi
3. **Quantity input** — Alpine.js `x-data="{ qty: 1 }"` dengan +/- buttons
4. **Add to cart form** — POST ke `cart.add` dengan product_id + quantity
5. **Related products** — Grid 4 kolom, card produk terkait (kategori sama)

### `cart/index.blade.php`

**Data:** `$cart` (dari session)

**Komponen:**

1. **Cart table** — Gambar, nama, harga, quantity (input number), subtotal per item
2. **Quantity buttons** — Form PATCH ke `cart.update` per item
3. **Remove button** — Form DELETE ke `cart.remove` per item
4. **Clear all** — Form DELETE ke `cart.clear`
5. **Summary** — Total items, subtotal, tombol "Lanjut ke Checkout"
6. **Empty state** — Pesan "Keranjang belanja kosong" + link ke produk

### `checkout/index.blade.php`

**Data:** `$cart`, `$shippingServices`

**Alpine.js:** `x-data="{ shippingCost: 0 }"` untuk kalkulasi total real-time

**Komponen:**

1. **Customer form** — Nama depan/belakang, negara, 2 baris alamat, kota, provinsi/state, kode pos, telepon opsional, email, catatan
    - Negara default Indonesia
    - Provinsi berupa dropdown untuk Indonesia dan input teks untuk negara lain
2. **Shipping options** — Radio buttons, `@click="shippingCost = {{ $service->cost }}"`
3. **Order summary sidebar** — Daftar item, subtotal, ongkir (dynamic), total (dynamic)
4. **Submit button** — POST ke `checkout.store`

### `checkout/success.blade.php`

**Data:** `$order`

**Alpine.js:** Countdown timer ke `payment_deadline`

- `x-data="{ timeLeft: ..., countdown: '' }"` + `setInterval` setiap detik
- Format: `HH:MM:SS`

**Komponen:**

1. **Success icon** (checkmark hijau)
2. **Order number** + deadline countdown
3. **Bank transfer info** — Dari `setting('bank_name')`, `setting('bank_account_number')`, `setting('bank_account_name')`
4. **Order detail** — Items, subtotal, ongkir, total
5. **CTA** — Link ke track-order + link ke home

### `track-order.blade.php`

**Data:** `$order` (optional, setelah search)

**Komponen:**

1. **Search form** — Order number + telepon/email, POST ke `track.search`
2. **Order result** (jika ditemukan):
    - Status badge (warna sesuai `status_color`)
    - Countdown timer (jika pending_payment)
    - Customer info + alamat terstruktur
    - Order items table
    - Total + ongkir
3. **Upload bukti bayar** (jika status = pending_payment dan belum expired):
    - Form POST ke `track.upload` dengan `enctype="multipart/form-data"`
    - Input file (accept image, max 2MB)
4. **Payment proof preview** (jika sudah upload)

---

## Auth Views

### `auth/login.blade.php`

**TIDAK extend layout** — Halaman standalone

**Komponen:**

1. Logo + nama toko
2. Form login: email, password, remember me checkbox
3. Error messages (validation + auth)
4. Submit button

---

## Admin Views

### `admin/dashboard.blade.php`

**Komponen:**

1. **4 Stat cards:**
    - Total Produk (`$totalProducts`)
    - Total Pesanan (`$totalOrders`)
    - Pesanan Pending (`$pendingOrders`)
    - Pendapatan Hari Ini (`$todayRevenue`)
2. **Recent orders table** — 10 pesanan terbaru: order_number, customer, total, status, tanggal

### `admin/products/index.blade.php`

- Search input + category dropdown filter
- Tombol "+ Tambah Produk"
- Table: gambar thumbnail, nama, kategori, harga, stok, status (aktif/nonaktif), aksi (edit/hapus)
- Pagination

### `admin/products/create.blade.php`

- Back link
- Form: nama, kategori (dropdown), harga, stok, deskripsi (textarea), gambar (file), is_active (checkbox)
- Validation error messages

### `admin/products/edit.blade.php`

- Sama seperti create, pre-filled dengan data produk
- Preview gambar saat ini
- Keterangan "Kosongkan jika tidak ingin mengganti gambar"

### `admin/categories/index.blade.php`

- Tombol "+ Tambah Kategori"
- Table: gambar, nama, slug, jumlah produk, aksi (edit/hapus)

### `admin/categories/create.blade.php` & `edit.blade.php`

- Form: nama, gambar (file)

### `admin/orders/index.blade.php`

- Search input + status dropdown filter (values: `pending_payment`, `payment_confirmed`, `processing`, `shipped`, `completed`, `cancelled`)
- Search mendukung nomor pesanan, nama depan/belakang, email, dan telepon
- Table: order_number (mono font), nama pelanggan, email, telepon jika tersedia, total, status badge, tanggal, link detail

### `admin/orders/show.blade.php`

- Order header: number, tanggal, status badge (menggunakan `status_color` accessor → Tailwind CSS classes)
- **Update status form** — Route: `admin.orders.status`, method PATCH. Dropdown status values: `pending_payment`, `payment_confirmed`, `processing`, `shipped`, `completed`, `cancelled` (kecuali jika status sudah completed/cancelled)
- Items table: gambar, nama, qty × harga, subtotal
- Financial summary: subtotal, ongkir (+ nama layanan), total
- Sidebar:
    - Data pelanggan terstruktur: nama depan, nama belakang, email, telepon, negara/wilayah, alamat jalan, detail alamat, kota, provinsi, kode pos, dan catatan
    - Fallback nama/alamat legacy untuk pesanan lama
    - Payment deadline info (jika status `pending_payment`) + expired warning
    - Bukti pembayaran (image preview, klik untuk full size)

### `admin/shipping/index.blade.php`

- Tombol "+ Tambah Layanan"
- Table: urutan, nama + deskripsi, biaya, estimasi, status, aksi

### `admin/shipping/create.blade.php` & `edit.blade.php`

- Form: nama, deskripsi, biaya, urutan, estimasi pengiriman, is_active

### `admin/sliders/index.blade.php`

- Tombol "+ Tambah Slider"
- Grid card (2 kolom): preview gambar, title, subtitle, status, urutan, aksi

### `admin/sliders/create.blade.php` & `edit.blade.php`

- Form: judul, subtitle, gambar (rekomendasi 1200x400), link, urutan, is_active

### `admin/settings/index.blade.php`

- Form grouped by `group` (payment, store)
- Setiap setting render input sesuai `type`:
    - `string` → `<input type="text">`
    - `integer` / `number` → `<input type="number">`
    - `textarea` → `<textarea>`
- Single submit button untuk semua settings

---

## Alpine.js Usage Summary

| View                         | Component          | Purpose                           |
| ---------------------------- | ------------------ | --------------------------------- |
| `layouts/app.blade.php`      | Flash message      | Auto-dismiss setelah 4 detik      |
| `layouts/admin.blade.php`    | Sidebar toggle     | Responsive sidebar show/hide      |
| `home.blade.php`             | Banner carousel    | Autoplay, prev/next, dots         |
| `products/show.blade.php`    | Quantity counter   | +/- buttons untuk qty input       |
| `checkout/index.blade.php`   | Shipping cost calc | Dynamic total saat pilih shipping |
| `checkout/success.blade.php` | Countdown timer    | Hitung mundur ke payment deadline |
| `track-order.blade.php`      | Countdown timer    | Hitung mundur (jika pending)      |

---

## Asset & Styling

### Tailwind CSS v4 Theme (`resources/css/app.css`)

```css
@import "tailwindcss";
@theme {
    --font-sans: "Inter", sans-serif;
    --color-primary-50: #f0fdf4;
    --color-primary-100: #dcfce7;
    /* ... sampai primary-900 */
}
```

### Build Output

```
public/build/
├── manifest.json
└── assets/
    ├── app-xxxxx.css    (~53 KB)
    └── app-xxxxx.js     (~37 KB)
```

> **PENTING:** Folder `public/build/` harus di-commit ke git dan diupload saat deploy. Shared hosting tidak bisa menjalankan `npm run build`.
