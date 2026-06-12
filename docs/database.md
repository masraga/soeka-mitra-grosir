# 🗄️ Database — Skema, Model & Seeder

## ERD (Entity Relationship)

```
users (1) ──── (auth only, admin)

categories (1) ──── (N) products
                              │
shipping_services (1) ──┐     │
                        │     │
                   orders (1) ──── (N) order_items
                        │                   │
                        │                   └── product_id (FK)
                        └── shipping_service_id (FK)

settings (standalone key-value store)
sliders  (standalone banner data)
```

---

## Tabel: `users`

> Migration: `0001_01_01_000000_create_users_table.php` + `2026_02_21_000001_add_role_to_users_table.php`

| Kolom                  | Tipe                              | Keterangan                  |
| ---------------------- | --------------------------------- | --------------------------- |
| id                     | bigint (PK)                       | Auto increment              |
| name                   | varchar(255)                      | Nama user                   |
| email                  | varchar(255) UNIQUE               | Email login                 |
| email_verified_at      | timestamp NULL                    | -                           |
| **role**               | varchar(255) DEFAULT `'customer'` | `'admin'` atau `'customer'` |
| password               | varchar(255)                      | Hashed password             |
| remember_token         | varchar(100)                      | -                           |
| created_at, updated_at | timestamps                        | -                           |

### Model: `App\Models\User`

**Fillable:** `name`, `email`, `password`, `role`

**Method:**

- `isAdmin(): bool` — Return `true` jika `role === 'admin'`

**Seeder Data:**

- Email: `admin@soekamitra.com`, Password: `password`, Role: `admin`

---

## Tabel: `settings`

> Migration: `2026_02_21_000002_create_settings_table.php`

| Kolom                  | Tipe                             | Keterangan                            |
| ---------------------- | -------------------------------- | ------------------------------------- |
| id                     | bigint (PK)                      | Auto increment                        |
| key                    | varchar(255) UNIQUE              | Identifier setting                    |
| value                  | text NULL                        | Nilai setting                         |
| type                   | varchar(255) DEFAULT `'string'`  | Tipe: `string`, `integer`, `textarea` |
| group                  | varchar(255) DEFAULT `'general'` | Grup: `payment`, `store`              |
| label                  | varchar(255) NULL                | Label tampilan di admin               |
| created_at, updated_at | timestamps                       | -                                     |

### Model: `App\Models\Setting`

**Fillable:** `key`, `value`, `type`, `group`, `label`

**Static Methods:**

- `get(string $key, mixed $default = null): mixed` — Ambil nilai (cached dengan `Cache::rememberForever`)
- `set(string $key, mixed $value): void` — Simpan nilai + clear cache
- `clearCache(): void` — Hapus cache settings

**Cache Strategy:** `Cache::rememberForever('app_settings', ...)` — Cache dihapus otomatis saat `set()` dipanggil.

**Seeder Data (8 settings):**

| Key                      | Default Value                       | Group   | Label                        |
| ------------------------ | ----------------------------------- | ------- | ---------------------------- |
| `payment_deadline_hours` | `1`                                 | payment | Batas Waktu Pembayaran (Jam) |
| `bank_name`              | `BCA`                               | payment | Nama Bank                    |
| `bank_account_number`    | `1234567890`                        | payment | Nomor Rekening               |
| `bank_account_name`      | `Soeka Mitra Grosir`                | payment | Atas Nama Rekening           |
| `store_name`             | `Soeka Mitra Grosir`                | store   | Nama Toko                    |
| `store_address`          | `Jl. Contoh No. 123, Jakarta`       | store   | Alamat Toko                  |
| `store_phone`            | `08123456789`                       | store   | Nomor Telepon Toko           |
| `store_description`      | `Toko grosir sembako terpercaya...` | store   | Deskripsi Toko               |

---

## Tabel: `categories`

> Migration: `2026_02_21_000003_create_categories_table.php`

| Kolom                  | Tipe                | Keterangan                         |
| ---------------------- | ------------------- | ---------------------------------- |
| id                     | bigint (PK)         | Auto increment                     |
| name                   | varchar(255)        | Nama kategori                      |
| slug                   | varchar(255) UNIQUE | URL-friendly slug (auto-generated) |
| image                  | varchar(255) NULL   | Path gambar di storage             |
| created_at, updated_at | timestamps          | -                                  |

### Model: `App\Models\Category`

**Fillable:** `name`, `slug`, `image`

**Relations:**

- `products(): HasMany` → `Product`

**Auto-behavior:**

- `creating`: Auto-generate slug dari name jika kosong
- `updating`: Auto-update slug jika name berubah

**Seeder Data (10 kategori):**
Beras & Gandum, Minyak Goreng, Gula & Garam, Tepung, Mie & Pasta, Susu & Olahan, Kopi & Teh, Bumbu Dapur, Makanan Kaleng, Sabun & Deterjen

---

## Tabel: `products`

> Migration: `2026_02_21_000004_create_products_table.php`

| Kolom                  | Tipe                   | Keterangan                                  |
| ---------------------- | ---------------------- | ------------------------------------------- |
| id                     | bigint (PK)            | Auto increment                              |
| category_id            | bigint (FK)            | → categories.id (CASCADE DELETE)            |
| name                   | varchar(255)           | Nama produk                                 |
| slug                   | varchar(255) UNIQUE    | URL-friendly slug (auto-generated)          |
| description            | text NULL              | Deskripsi produk                            |
| price                  | unsigned int           | Harga dalam Rupiah (integer, bukan decimal) |
| stock                  | unsigned int DEFAULT 0 | Jumlah stok                                 |
| image                  | varchar(255) NULL      | Path gambar di storage                      |
| is_active              | boolean DEFAULT true   | Tampil di storefront?                       |
| created_at, updated_at | timestamps             | -                                           |

### Model: `App\Models\Product`

**Fillable:** `category_id`, `name`, `slug`, `description`, `price`, `stock`, `image`, `is_active`

**Casts:** `price` → integer, `stock` → integer, `is_active` → boolean

**Relations:**

- `category(): BelongsTo` → `Category`

**Scopes:**

- `active($query)` — `where('is_active', true)`
- `available($query)` — `active()` + `where('stock', '>', 0)`

**Accessors:**

- `formatted_price` — Return `format_rupiah($this->price)`

**Auto-behavior:**

- `creating`: Auto-generate slug dari name
- `updating`: Auto-update slug jika name berubah

**Seeder Data:** 29 produk sembako dengan harga realistis dalam Rupiah

---

## Tabel: `shipping_services`

> Migration: `2026_02_21_000005_create_shipping_services_table.php`

| Kolom                  | Tipe                   | Keterangan                |
| ---------------------- | ---------------------- | ------------------------- |
| id                     | bigint (PK)            | Auto increment            |
| name                   | varchar(255)           | Nama layanan              |
| description            | text NULL              | Deskripsi                 |
| cost                   | unsigned int           | Biaya dalam Rupiah        |
| estimated_delivery     | varchar(255) NULL      | Estimasi waktu pengiriman |
| is_active              | boolean DEFAULT true   | Tampil di checkout?       |
| sort_order             | unsigned int DEFAULT 0 | Urutan tampil             |
| created_at, updated_at | timestamps             | -                         |

### Model: `App\Models\ShippingService`

**Fillable:** `name`, `description`, `cost`, `estimated_delivery`, `is_active`, `sort_order`

**Scopes:**

- `active($query)` — `where('is_active', true)->orderBy('sort_order')`

**Accessors:**

- `formatted_cost` — `'Gratis'` jika cost = 0, atau `format_rupiah($this->cost)`

**Seeder Data (4 layanan):**

| Nama                   | Biaya         | Estimasi |
| ---------------------- | ------------- | -------- |
| Ambil di Toko          | Rp 0 (Gratis) | Langsung |
| Kurir Toko             | Rp 10.000     | 1-2 hari |
| Gosend / Grab Instant  | Rp 15.000     | Hari ini |
| Gosend / Grab Same Day | Rp 20.000     | Hari ini |

---

## Tabel: `orders`

> Migration: `2026_02_21_000006_create_orders_table.php`

| Kolom                  | Tipe                | Keterangan                          |
| ---------------------- | ------------------- | ----------------------------------- |
| id                     | bigint (PK)         | Auto increment                      |
| order_number           | varchar(255) UNIQUE | Format: `ORD-YYYYMMDD-XXXXX`        |
| customer_name          | varchar(255)        | Snapshot nama lengkap (kompatibilitas) |
| customer_first_name    | varchar(255) NULL   | Nama depan                          |
| customer_last_name     | varchar(255) NULL   | Nama belakang                       |
| customer_email         | varchar(255) NULL   | Email pelanggan                     |
| customer_phone         | varchar(255) NULL   | Nomor telepon opsional              |
| customer_country_code  | char(2) NULL        | Kode negara ISO                     |
| customer_address       | text                | Snapshot alamat lengkap             |
| customer_address_line_1| text NULL           | Nomor rumah dan nama jalan          |
| customer_address_line_2| text NULL           | Apartemen/unit/detail tambahan      |
| customer_city          | varchar(255) NULL   | Kota                                |
| customer_province      | varchar(255) NULL   | Provinsi/state                      |
| customer_postal_code   | varchar(32) NULL    | Kode pos                            |
| notes                  | text NULL           | Catatan tambahan                    |
| shipping_service_id    | bigint (FK)         | → shipping_services.id              |
| shipping_service_name  | varchar(255)        | Snapshot nama layanan saat checkout |
| shipping_cost          | unsigned int        | Snapshot biaya kirim saat checkout  |
| subtotal               | unsigned bigint     | Total harga produk (tanpa ongkir)   |
| total_price            | unsigned bigint     | subtotal + shipping_cost            |
| status                 | enum                | Status pesanan (lihat di bawah)     |
| payment_proof          | varchar(255) NULL   | Path bukti pembayaran di storage    |
| payment_deadline       | timestamp NULL      | Batas waktu pembayaran              |
| created_at, updated_at | timestamps          | -                                   |

**Status Enum Values:**

| Value               | Label (Indonesia)       | CSS Class (status_color)        |
| ------------------- | ----------------------- | ------------------------------- |
| `pending_payment`   | Menunggu Pembayaran     | `bg-yellow-100 text-yellow-800` |
| `payment_confirmed` | Pembayaran Dikonfirmasi | `bg-blue-100 text-blue-800`     |
| `processing`        | Diproses                | `bg-indigo-100 text-indigo-800` |
| `shipped`           | Dikirim                 | `bg-purple-100 text-purple-800` |
| `completed`         | Selesai                 | `bg-green-100 text-green-800`   |
| `cancelled`         | Dibatalkan              | `bg-red-100 text-red-800`       |

### Model: `App\Models\Order`

**Fillable:** mencakup snapshot legacy (`customer_name`, `customer_address`), semua field pelanggan terstruktur, data pengiriman, total, status, dan pembayaran.

**Casts:** `subtotal` → integer, `total_price` → integer, `shipping_cost` → integer, `payment_deadline` → datetime

**Relations:**

- `items(): HasMany` → `OrderItem`
- `shippingService(): BelongsTo` → `ShippingService`

**Accessors:**

- `customer_full_name: string` — Gabungkan nama depan/belakang, fallback ke `customer_name`
- `customer_country: ?string` — Nama negara dari kode negara
- `customer_formatted_address: string` — Alamat terstruktur, fallback ke `customer_address`
- `is_expired: bool` — `true` jika status `pending_payment` dan deadline sudah lewat
- `time_remaining: ?string` — Human-readable sisa waktu, atau `'Kedaluwarsa'`
- `status_label: string` — Label Indonesia dari status
- `status_color: string` — Tailwind CSS class untuk badge (contoh: `'bg-yellow-100 text-yellow-800'`)

**Static Methods:**

- `generateOrderNumber(): string` — Format `ORD-YYYYMMDD-XXXXX`, auto-increment per hari

---

## Tabel: `order_items`

> Migration: `2026_02_21_000007_create_order_items_table.php`

| Kolom                  | Tipe            | Keterangan                            |
| ---------------------- | --------------- | ------------------------------------- |
| id                     | bigint (PK)     | Auto increment                        |
| order_id               | bigint (FK)     | → orders.id (CASCADE DELETE)          |
| product_id             | bigint (FK)     | → products.id                         |
| product_name           | varchar(255)    | Snapshot nama produk saat checkout    |
| quantity               | unsigned int    | Jumlah item                           |
| price                  | unsigned int    | Snapshot harga per item saat checkout |
| subtotal               | unsigned bigint | price × quantity                      |
| created_at, updated_at | timestamps      | -                                     |

### Model: `App\Models\OrderItem`

**Fillable:** `order_id`, `product_id`, `product_name`, `quantity`, `price`, `subtotal`

**Relations:**

- `order(): BelongsTo` → `Order`
- `product(): BelongsTo` → `Product`

> **Note:** `product_name` dan `price` disimpan sebagai snapshot agar data pesanan tetap akurat meskipun produk diubah/dihapus nanti.

---

## Tabel: `sliders`

> Migration: `2026_02_21_000008_create_sliders_table.php`

| Kolom                  | Tipe                   | Keterangan             |
| ---------------------- | ---------------------- | ---------------------- |
| id                     | bigint (PK)            | Auto increment         |
| title                  | varchar(255)           | Judul slider           |
| subtitle               | varchar(255) NULL      | Sub-judul              |
| image                  | varchar(255)           | Path gambar di storage |
| link                   | varchar(255) NULL      | URL tujuan saat diklik |
| is_active              | boolean DEFAULT true   | Tampil di homepage?    |
| sort_order             | unsigned int DEFAULT 0 | Urutan tampil          |
| created_at, updated_at | timestamps             | -                      |

### Model: `App\Models\Slider`

**Fillable:** `title`, `subtitle`, `image`, `link`, `is_active`, `sort_order`

**Scopes:**

- `active($query)` — `where('is_active', true)->orderBy('sort_order')`

---

## Tabel Laravel Default

| Tabel         | Migration                                  | Keterangan                      |
| ------------- | ------------------------------------------ | ------------------------------- |
| `cache`       | `0001_01_01_000001_create_cache_table.php` | Untuk `CACHE_STORE=database`    |
| `cache_locks` | (sama)                                     | Lock mechanism                  |
| `sessions`    | `0001_01_01_000000_create_users_table.php` | Untuk `SESSION_DRIVER=database` |
| `jobs`        | `0001_01_01_000002_create_jobs_table.php`  | Tidak terpakai (queue = sync)   |
| `job_batches` | (sama)                                     | Tidak terpakai                  |
| `failed_jobs` | (sama)                                     | Tidak terpakai                  |

---

## Seeder Execution Order

File: `database/seeders/DatabaseSeeder.php`

```
1. Create admin user (admin@soekamitra.com / password / role=admin)
2. SettingSeeder    → 8 settings
3. CategorySeeder   → 10 kategori
4. ProductSeeder    → 29 produk (depends on categories)
5. ShippingServiceSeeder → 4 layanan
6. SliderSeeder     → 3 slider
```

Semua seeder menggunakan `updateOrCreate` sehingga aman untuk dijalankan berulang kali.
