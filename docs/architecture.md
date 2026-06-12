# 🏗️ Arsitektur & Struktur Proyek

## Struktur Folder

```
soeka-mitra-grosir/
├── app/
│   ├── Console/Commands/
│   │   └── CancelExpiredOrders.php        # Artisan command auto-cancel
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── Auth/
│   │   │   │   └── LoginController.php    # Login/logout admin
│   │   │   ├── Admin/
│   │   │   │   ├── DashboardController.php
│   │   │   │   ├── ProductController.php
│   │   │   │   ├── CategoryController.php
│   │   │   │   ├── OrderController.php
│   │   │   │   ├── ShippingServiceController.php
│   │   │   │   ├── SliderController.php
│   │   │   │   └── SettingController.php
│   │   │   ├── HomeController.php         # Homepage storefront (banner dari public/banner/)
│   │   │   ├── ProductController.php      # Listing & detail produk
│   │   │   ├── CartController.php         # Keranjang (session-based)
│   │   │   ├── CheckoutController.php     # Proses checkout
│   │   │   └── OrderTrackingController.php # Lacak pesanan
│   │   └── Middleware/
│   │       └── AdminMiddleware.php        # Proteksi route admin
│   ├── Models/
│   │   ├── User.php                       # + role, isAdmin()
│   │   ├── Setting.php                    # Key-value settings + cache
│   │   ├── Category.php                   # Auto-generate slug
│   │   ├── Product.php                    # Scopes: active(), available()
│   │   ├── ShippingService.php            # Scope: active()
│   │   ├── Order.php                      # generateOrderNumber(), accessors
│   │   ├── OrderItem.php                  # Belongs to Order & Product
│   │   └── Slider.php                     # Scope: active()
│   ├── Providers/
│   │   └── AppServiceProvider.php
│   └── helpers.php                        # Global helpers (setting, format_rupiah, cart_count, cart_total)
├── bootstrap/
│   └── app.php                            # Middleware alias 'admin' terdaftar di sini
├── config/                                # Konfigurasi Laravel standar
│   └── locations.php                      # Negara + provinsi Indonesia untuk checkout
├── database/
│   ├── migrations/
│   │   ├── 0001_01_01_000000_create_users_table.php        # Default Laravel
│   │   ├── 0001_01_01_000001_create_cache_table.php        # Default Laravel
│   │   ├── 0001_01_01_000002_create_jobs_table.php         # Default Laravel
│   │   ├── 2026_02_21_000001_add_role_to_users_table.php
│   │   ├── 2026_02_21_000002_create_settings_table.php
│   │   ├── 2026_02_21_000003_create_categories_table.php
│   │   ├── 2026_02_21_000004_create_products_table.php
│   │   ├── 2026_02_21_000005_create_shipping_services_table.php
│   │   ├── 2026_02_21_000006_create_orders_table.php
│   │   ├── 2026_02_21_000007_create_order_items_table.php
│   │   ├── 2026_02_21_000008_create_sliders_table.php
│   │   └── 2026_06_12_000001_add_structured_customer_fields_to_orders_table.php
│   └── seeders/
│       ├── DatabaseSeeder.php             # Orchestrator: admin user + semua seeder
│       ├── SettingSeeder.php              # 8 settings (payment + store)
│       ├── CategorySeeder.php             # 10 kategori sembako
│       ├── ProductSeeder.php              # 29 produk sample
│       ├── ShippingServiceSeeder.php      # 4 layanan pengiriman
│       └── SliderSeeder.php               # 3 slider banner
├── resources/
│   ├── css/app.css                        # Tailwind v4 theme: Inter font, green palette
│   ├── js/app.js                          # Bootstrap file
│   └── views/
│       ├── layouts/
│       │   ├── app.blade.php              # Layout storefront (header, footer, flash)
│       │   └── admin.blade.php            # Layout admin (sidebar, topbar, flash)
│       ├── home.blade.php                 # Homepage: slider carousel + produk terbaru
│       ├── products/
│       │   ├── index.blade.php            # Listing produk + search + filter kategori
│       │   └── show.blade.php             # Detail produk + produk terkait
│       ├── cart/
│       │   └── index.blade.php            # Keranjang belanja
│       ├── checkout/
│       │   ├── index.blade.php            # Form checkout + pilih pengiriman
│       │   └── success.blade.php          # Konfirmasi pesanan + countdown
│       ├── track-order.blade.php          # Lacak pesanan + upload bukti bayar
│       ├── auth/
│       │   └── login.blade.php            # Form login admin
│       └── admin/
│           ├── dashboard.blade.php        # Dashboard statistik
│           ├── products/
│           │   ├── index.blade.php
│           │   ├── create.blade.php
│           │   └── edit.blade.php
│           ├── categories/
│           │   ├── index.blade.php
│           │   ├── create.blade.php
│           │   └── edit.blade.php
│           ├── orders/
│           │   ├── index.blade.php
│           │   └── show.blade.php
│           ├── shipping/
│           │   ├── index.blade.php
│           │   ├── create.blade.php
│           │   └── edit.blade.php
│           ├── sliders/
│           │   ├── index.blade.php
│           │   ├── create.blade.php
│           │   └── edit.blade.php
│           └── settings/
│               └── index.blade.php
├── routes/
│   ├── web.php                            # Semua route HTTP
│   └── console.php                        # Scheduler: orders:cancel-expired
├── public/
│   ├── build/                             # Vite build output (commit ke git)
│   └── uploads/                           # Folder upload file (products, categories, sliders, proofs)
│       ├── products/
│       ├── categories/
│       ├── sliders/
│       └── proofs/
├── docs/                                  # Dokumentasi ini
└── .env                                   # Environment config (JANGAN commit)
```

## Konfigurasi Penting

### `.env` — Setting yang HARUS diperhatikan

```dotenv
APP_NAME="Soeka Mitra Grosir"
APP_ENV=local                    # Ubah ke 'production' saat deploy
APP_DEBUG=true                   # Ubah ke 'false' saat deploy

DB_CONNECTION=mysql
DB_DATABASE=soeka_mitra_grosir
DB_USERNAME=root
DB_PASSWORD=17September!

SESSION_DRIVER=database          # HARUS database (shared hosting)
CACHE_STORE=database             # HARUS database (shared hosting)
QUEUE_CONNECTION=sync            # HARUS sync (shared hosting tidak support worker)
```

### `composer.json` — Autoload

```json
"autoload": {
    "files": ["app/helpers.php"],
    "psr-4": {
        "App\\": "app/",
        "Database\\Factories\\": "database/factories/",
        "Database\\Seeders\\": "database/seeders/"
    }
}
```

> **Penting:** Jika menambah file helper baru, tambahkan ke array `files` lalu jalankan `composer dump-autoload`.

### `bootstrap/app.php` — Middleware Alias

```php
->withMiddleware(function (Middleware $middleware): void {
    $middleware->alias([
        'admin' => \App\Http\Middleware\AdminMiddleware::class,
    ]);
})
```

### `resources/css/app.css` — Theme

Menggunakan Tailwind CSS v4 dengan:

- Font: `Inter` (via Google Fonts)
- Primary color: Green palette (`--color-primary-50` sampai `--color-primary-900`)

### Global Helpers (`app/helpers.php`)

| Helper            | Signature                                            | Deskripsi                                  |
| ----------------- | ---------------------------------------------------- | ------------------------------------------ |
| `setting()`       | `setting(string $key, mixed $default = null): mixed` | Ambil nilai setting dari database (cached) |
| `format_rupiah()` | `format_rupiah(int\|float $amount): string`          | Format angka ke Rupiah: `Rp 75.000`        |
| `cart_count()`    | `cart_count(): int`                                  | Total item di keranjang (session)          |
| `cart_total()`    | `cart_total(): int`                                  | Subtotal keranjang (session)               |

## Alur Request

```
Browser Request
    → routes/web.php
        → Middleware (auth, admin)
            → Controller
                → Model (Eloquent)
                    → Database
                → View (Blade + Alpine.js)
    → Response HTML
```

## Konvensi Kode

1. **Controllers** — Thin controller, logika bisnis di controller (karena aplikasi kecil)
2. **Models** — Auto-slug via `booted()`, scopes untuk filter (`active()`, `available()`)
3. **Views** — Blade template dengan Alpine.js untuk interaktivitas (carousel, counter, dll)
4. **Routes** — Grouped by concern: storefront, auth, admin, setup
5. **Session** — Cart disimpan sebagai array di session key `cart`
6. **Image Upload** — Disimpan ke `public/uploads/{folder}`, diakses via `asset('uploads/...')`
7. **Checkout Address** — Negara memakai kode ISO 2 karakter; provinsi Indonesia memakai daftar lokal
