# 👨‍💼 Panduan Admin Panel

## Akses Admin

| URL      | `https://yourdomain.com/admin/login` |
| -------- | ------------------------------------ |
| Email    | `admin@soekamitra.com`               |
| Password | `password`                           |

> ⚠️ **Segera ganti password default setelah deploy pertama!**

---

## Menu Admin

### 1. Dashboard (`/admin`)

Menampilkan ringkasan statistik:

| Kartu               | Data                                                      |
| ------------------- | --------------------------------------------------------- |
| Total Produk        | Jumlah semua produk                                       |
| Total Pesanan       | Jumlah semua pesanan                                      |
| Pesanan Pending     | Pesanan yang belum dibayar                                |
| Pendapatan Hari Ini | Total dari pesanan hari ini (exclude cancelled & pending) |

Plus tabel **10 pesanan terbaru**.

---

### 2. Produk (`/admin/products`)

**Fitur:**

- Cari produk berdasarkan nama
- Filter berdasarkan kategori
- Tambah produk baru
- Edit produk existing
- Hapus produk (gambar di storage ikut dihapus)

**Field Produk:**

| Field       | Wajib | Keterangan                                      |
| ----------- | ----- | ----------------------------------------------- |
| Nama Produk | ✅    | Max 255 karakter                                |
| Kategori    | ✅    | Pilih dari dropdown                             |
| Harga (Rp)  | ✅    | Angka bulat (tanpa desimal)                     |
| Stok        | ✅    | Angka bulat, min 0                              |
| Deskripsi   | ❌    | Teks panjang (textarea)                         |
| Gambar      | ❌    | JPEG/PNG/JPG/WebP, max 2MB                      |
| Aktif       | ❌    | Default: aktif. Nonaktif = tidak tampil di toko |

**Catatan:**

- Slug otomatis di-generate dari nama produk
- Jika stok = 0, produk tetap tampil tapi tombol "Tambah" disabled
- Menghapus produk yang sudah ada di order items tetap aman (product_name disnapshot)

---

### 3. Kategori (`/admin/categories`)

**Fitur:**

- Tambah, edit, hapus kategori
- Melihat jumlah produk per kategori
- Upload gambar kategori (opsional)

**Aturan Hapus:**

- ❌ Kategori **TIDAK BISA** dihapus jika masih memiliki produk
- Pindahkan atau hapus produk terlebih dahulu

---

### 4. Pesanan (`/admin/orders`)

**Fitur:**

- Cari berdasarkan nomor pesanan, nama, atau telepon
- Filter berdasarkan status
- Lihat detail pesanan
- Update status pesanan

**Detail Pesanan menampilkan:**

- Informasi pelanggan (nama, telepon, alamat, catatan)
- Daftar item pesanan (gambar, nama, qty, harga, subtotal)
- Ringkasan keuangan (subtotal, ongkir, total)
- Batas waktu pembayaran + sisa waktu
- Bukti pembayaran (klik untuk full-size)

**Alur Status:**

```
Menunggu Pembayaran
    → Pembayaran Dikonfirmasi (setelah cek bukti bayar)
        → Diproses (mulai packing)
            → Dikirim (serahkan ke kurir)
                → Selesai (pelanggan terima)

Menunggu Pembayaran → Dibatalkan (manual atau auto-cancel)
```

**⚠️ PENTING tentang Cancel:**

- Saat status diubah ke "Dibatalkan", stok produk **otomatis dikembalikan**
- Pesanan yang sudah `Selesai` atau `Dibatalkan` tidak bisa diubah statusnya lagi

---

### 5. Pengiriman (`/admin/shipping`)

**Fitur:**

- CRUD layanan pengiriman
- Atur urutan tampil (sort_order)
- Aktif/nonaktif layanan

**Field:**

| Field               | Wajib | Keterangan                                 |
| ------------------- | ----- | ------------------------------------------ |
| Nama Layanan        | ✅    | contoh: "Kurir Toko"                       |
| Deskripsi           | ❌    | Keterangan tambahan                        |
| Biaya (Rp)          | ✅    | Isi 0 untuk gratis                         |
| Estimasi Pengiriman | ❌    | contoh: "1-2 hari"                         |
| Urutan              | ❌    | Default 0, angka lebih kecil tampil duluan |
| Aktif               | ❌    | Nonaktif = tidak tampil di checkout        |

---

### 6. Slider (`/admin/sliders`)

**Fitur:**

- CRUD slider/banner homepage
- Preview gambar
- Atur urutan + aktif/nonaktif

**Field:**

| Field    | Wajib | Keterangan                      |
| -------- | ----- | ------------------------------- |
| Judul    | ✅    | Teks judul di slider            |
| Subtitle | ❌    | Teks di bawah judul             |
| Gambar   | ✅\*  | Rekomendasi 1200×400px, max 2MB |
| Link     | ❌    | URL tujuan saat diklik          |
| Urutan   | ❌    | Angka kecil = tampil duluan     |
| Aktif    | ❌    | Default aktif                   |

\*Wajib saat create, opsional saat edit (kosongkan = tetap pakai gambar lama)

---

### 7. Pengaturan (`/admin/settings`)

**Grup Payment (Pembayaran):**

| Setting                      | Fungsi                                                      |
| ---------------------------- | ----------------------------------------------------------- |
| Batas Waktu Pembayaran (Jam) | Berapa jam setelah checkout sebelum auto-cancel. Default: 1 |
| Nama Bank                    | Ditampilkan ke pelanggan di halaman sukses + tracking       |
| Nomor Rekening               | Ditampilkan ke pelanggan                                    |
| Atas Nama Rekening           | Ditampilkan ke pelanggan                                    |

**Grup Store (Toko):**

| Setting            | Fungsi                        |
| ------------------ | ----------------------------- |
| Nama Toko          | Header, footer, halaman login |
| Alamat Toko        | Footer                        |
| Nomor Telepon Toko | Footer                        |
| Deskripsi Toko     | Footer                        |

**Cara Pakai:**

1. Ubah nilai yang diinginkan
2. Klik "Simpan Pengaturan"
3. Perubahan langsung berlaku (cache otomatis di-refresh)

---

## Workflow Harian Admin

### Pagi

1. Login ke `/admin`
2. Cek Dashboard → lihat pesanan pending
3. Buka Pesanan → filter "Sudah Dibayar" (payment_confirmed)
4. Cek bukti pembayaran setiap pesanan
5. Jika valid → ubah status ke "Diproses"

### Saat Memproses

1. Pack pesanan
2. Ubah status ke "Dikirim" setelah serahkan ke kurir
3. Informasikan pelanggan via telepon/WA (nomor ada di detail pesanan)

### Saat Selesai

1. Setelah pelanggan konfirmasi terima
2. Ubah status ke "Selesai"

### Maintenance

1. Tambah/update stok produk secara berkala
2. Update harga jika ada perubahan
3. Ganti slider banner untuk promosi baru
4. Cek Settings → pastikan info bank masih benar
