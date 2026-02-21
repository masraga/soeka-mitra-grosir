# 📖 Dokumentasi Soeka Mitra Grosir

> **PENTING:** Baca seluruh dokumentasi di folder `docs/` sebelum melakukan update atau perubahan pada sistem ini.

## Deskripsi Proyek

**Soeka Mitra Grosir** adalah aplikasi toko online untuk produk sembako (sembilan bahan pokok) yang dibangun menggunakan Laravel 12. Aplikasi ini dirancang untuk:

- **Pelanggan (Guest):** Menjelajahi produk, menambahkan ke keranjang, checkout tanpa login, melacak pesanan, dan upload bukti pembayaran.
- **Admin:** Mengelola produk, kategori, pesanan, layanan pengiriman, slider banner, dan pengaturan toko.

## Tech Stack

| Komponen        | Teknologi        | Versi     |
| --------------- | ---------------- | --------- |
| Backend         | Laravel          | 12.x      |
| PHP             | PHP              | 8.2+      |
| Database        | MySQL            | 8.x       |
| Frontend CSS    | Tailwind CSS     | v4        |
| Build Tool      | Vite             | 7.x       |
| JS Interaktif   | Alpine.js        | 3.x (CDN) |
| Session & Cache | Database Driver  | -         |
| Queue           | Sync (no worker) | -         |

## Fitur Utama

1. **Storefront tanpa login** — Pelanggan langsung belanja tanpa perlu daftar akun
2. **Keranjang belanja (session-based)** — Disimpan di session, bukan database
3. **Checkout dengan data pelanggan** — Nama, telepon, alamat diisi saat checkout
4. **Pembayaran transfer bank** — Upload bukti pembayaran via halaman tracking
5. **Auto-cancel pesanan** — Pesanan expired otomatis dibatalkan + stok dikembalikan
6. **Batas waktu pembayaran dinamis** — Diatur admin via Settings (default: 1 jam)
7. **Lacak pesanan** — Cari dengan nomor pesanan + nomor telepon
8. **Layanan pengiriman** — Master data pengiriman dikelola admin
9. **Slider banner** — Banner promosi di homepage
10. **Panel admin lengkap** — CRUD produk, kategori, pesanan, pengiriman, slider, settings

## Daftar Dokumentasi

| File                                           | Isi                                                           |
| ---------------------------------------------- | ------------------------------------------------------------- |
| [architecture.md](architecture.md)             | Arsitektur, struktur folder, tech stack, konfigurasi          |
| [database.md](database.md)                     | Skema database, tabel, relasi, model Eloquent, seeder         |
| [routes-controllers.md](routes-controllers.md) | Semua route, controller, method, middleware                   |
| [views.md](views.md)                           | Daftar view Blade, layout, Alpine.js interaksi                |
| [features.md](features.md)                     | Detail fitur: cart, checkout, auto-cancel, tracking, settings |
| [deployment.md](deployment.md)                 | Panduan deploy ke shared hosting                              |
| [admin-guide.md](admin-guide.md)               | Panduan penggunaan panel admin                                |

## Kredensial Default

| Akun  | Email                  | Password   |
| ----- | ---------------------- | ---------- |
| Admin | `admin@soekamitra.com` | `password` |

## Quick Reference

```
# Jalankan development server
php artisan serve

# Build assets (Tailwind CSS)
npm run build

# Migrasi + Seed ulang
php artisan migrate:fresh --seed

# Jalankan scheduler manual
php artisan orders:cancel-expired

# Regenerate autoload
composer dump-autoload
```

## Aturan Pengembangan

1. **SELALU baca docs/ sebelum mengubah kode**
2. Queue driver HARUS `sync` (shared hosting tidak support worker)
3. Alpine.js dimuat via CDN, bukan npm
4. Semua asset CSS/JS harus di-build dengan `npm run build` sebelum deploy
5. Gunakan helper `setting()` untuk mengambil pengaturan dari database
6. Gunakan helper `format_rupiah()` untuk format mata uang
7. Cart disimpan di session dengan key `cart`
8. Order number format: `ORD-YYYYMMDD-XXXXX`
