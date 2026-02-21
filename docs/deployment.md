# 🚀 Panduan Deployment (Shared Hosting)

## Persyaratan Hosting

| Komponen       | Minimum                                                               |
| -------------- | --------------------------------------------------------------------- |
| PHP            | 8.2+                                                                  |
| MySQL          | 5.7+ / MariaDB 10.3+                                                  |
| PHP Extensions | OpenSSL, PDO, Mbstring, Tokenizer, XML, Ctype, JSON, BCMath, Fileinfo |
| Disk Space     | ~100 MB (aplikasi + vendor)                                           |
| Cron Job       | Tersedia (untuk auto-cancel)                                          |

## Langkah Deploy

### 1. Persiapan Lokal

```bash
# Build asset CSS/JS (WAJIB dilakukan di lokal, bukan di server)
npm run build

# Pastikan folder public/build/ ada dan berisi file hasil build
ls public/build/assets/

# Optimize autoload
composer install --optimize-autoloader --no-dev

# Clear cache
php artisan config:clear
php artisan route:clear
php artisan view:clear
```

### 2. Upload File ke Hosting

Upload **semua file** ke hosting kecuali:

- `node_modules/` (tidak perlu)
- `.git/` (tidak perlu)
- `tests/` (opsional)

**Struktur di hosting:**

```
/home/username/
├── public_html/           ← Document root (isi folder public/)
│   ├── index.php          ← Entry point (EDIT path)
│   ├── robots.txt
│   ├── .htaccess
│   ├── build/             ← Vite build output
│   └── storage/           ← Symlink (buat manual)
│
└── laravel/               ← Folder aplikasi (di LUAR public_html)
    ├── app/
    ├── bootstrap/
    ├── config/
    ├── database/
    ├── resources/
    ├── routes/
    ├── storage/
    ├── vendor/
    ├── .env
    ├── artisan
    └── composer.json
```

### 3. Edit `public_html/index.php`

Ubah path ke folder laravel:

```php
// Sebelum:
require __DIR__.'/../vendor/autoload.php';
$app = require_once __DIR__.'/../bootstrap/app.php';

// Sesudah:
require __DIR__.'/../laravel/vendor/autoload.php';
$app = require_once __DIR__.'/../laravel/bootstrap/app.php';
```

### 4. Konfigurasi `.env` di Server

```dotenv
APP_NAME="Soeka Mitra Grosir"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com

DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=nama_database_hosting
DB_USERNAME=user_database_hosting
DB_PASSWORD=password_database_hosting

SESSION_DRIVER=database
CACHE_STORE=database
QUEUE_CONNECTION=sync          # WAJIB sync!

# Session config
SESSION_LIFETIME=120
SESSION_ENCRYPT=false
```

### 5. Jalankan Setup via Browser

Buka URL berikut di browser:

```
https://yourdomain.com/setup/soeka-setup-2026
```

Ini akan menjalankan:

1. `php artisan migrate` — Buat semua tabel
2. `php artisan db:seed` — Isi data awal (admin, kategori, produk, dll)
3. `php artisan storage:link` — Buat symlink storage

> ⚠️ **PENTING:** Setelah berhasil, HAPUS atau disable route setup di `routes/web.php` untuk keamanan!

### 6. Buat Storage Symlink (Manual, jika setup route gagal)

Jika symlink tidak bisa dibuat via route, buat manual via File Manager hosting:

```
public_html/storage → ../laravel/storage/app/public
```

Atau via SSH (jika tersedia):

```bash
cd /home/username/public_html
ln -s ../laravel/storage/app/public storage
```

### 7. Setup Cron Job

Di cPanel → Cron Jobs, tambahkan:

```
*/5 * * * * cd /home/username/laravel && php artisan schedule:run >> /dev/null 2>&1
```

**Interval:** Setiap 5 menit
**Fungsi:** Menjalankan `orders:cancel-expired` untuk auto-cancel pesanan expired

### 8. Set Permissions

```bash
# Storage harus writable
chmod -R 775 storage/
chmod -R 775 bootstrap/cache/

# Jika ada masalah upload gambar
chmod -R 775 storage/app/public/
```

---

## Troubleshooting

### Error 500 setelah deploy

1. Cek `.env` sudah ada dan terisi benar
2. Pastikan `APP_KEY` sudah di-generate: `php artisan key:generate`
3. Cek permission: `storage/` dan `bootstrap/cache/` harus writable (775)
4. Cek log: `storage/logs/laravel.log`

### Gambar tidak tampil

1. Pastikan symlink `public_html/storage` → `../laravel/storage/app/public` sudah benar
2. Cek file gambar ada di `laravel/storage/app/public/products/` (atau `sliders/`, `proofs/`, `categories/`)

### Session tidak bekerja

1. Pastikan tabel `sessions` sudah ada (cek migration)
2. Pastikan `SESSION_DRIVER=database` di `.env`
3. Pastikan database connection benar

### Auto-cancel tidak berjalan

1. Cek cron job sudah terdaftar di cPanel
2. Path harus absolut: `/home/username/laravel`
3. Cek log: `storage/logs/scheduler.log`
4. Test manual: `php artisan orders:cancel-expired`

### Upload gambar gagal

1. Cek `php.ini`: `upload_max_filesize` >= 2M, `post_max_size` >= 8M
2. Cek permission folder `storage/app/public/` (775)
3. Cek PHP extension `fileinfo` aktif

---

## Keamanan Post-Deploy

1. ✅ Set `APP_DEBUG=false`
2. ✅ Set `APP_ENV=production`
3. ✅ Hapus route `/setup/{token}` dari `routes/web.php`
4. ✅ Ganti password admin default (`password` → password kuat)
5. ✅ Ganti `APP_KEY` jika perlu
6. ✅ Pastikan `.env` tidak bisa diakses publik (`.htaccess` default Laravel sudah handle)

---

## Update Aplikasi di Hosting

```
1. Build assets di lokal:     npm run build
2. Upload file yang berubah ke hosting (kecuali .env, node_modules)
3. Jika ada migration baru:   Buka /setup/soeka-setup-2026 (atau SSH: php artisan migrate)
4. Clear cache:               php artisan config:clear (via SSH atau buat route temporary)
```

> Untuk clear cache tanpa SSH, bisa buat route temporary:
>
> ```php
> Route::get('/clear-cache/{token}', function($token) {
>     if ($token !== 'secret-token') abort(403);
>     Artisan::call('config:clear');
>     Artisan::call('route:clear');
>     Artisan::call('view:clear');
>     return 'Cache cleared!';
> });
> ```
