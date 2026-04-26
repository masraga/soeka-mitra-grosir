@extends('layouts.app')
@section('title', 'Ketentuan & Kebijakan Privasi')

@section('content')
<div class="max-w-4xl mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold text-gray-900 mb-8">Ketentuan Penggunaan & Kebijakan Privasi</h1>

    <div class="space-y-8">
        <!-- Ketentuan Penggunaan -->
        <section>
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Ketentuan Penggunaan</h2>

            <div class="prose prose-gray max-w-none">
                <h3 class="text-xl font-medium text-gray-700 mb-2">1. Penerimaan Ketentuan</h3>
                <p class="text-gray-600 mb-4">
                    Dengan mengakses dan menggunakan website Soeka Mitra Grosir, Anda setuju untuk terikat oleh ketentuan penggunaan ini. Jika Anda tidak setuju dengan ketentuan ini, mohon untuk tidak menggunakan layanan kami.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">2. Deskripsi Layanan</h3>
                <p class="text-gray-600 mb-4">
                    Soeka Mitra Grosir adalah platform e-commerce yang menyediakan produk sembako (sembilan bahan pokok) untuk kebutuhan grosir. Layanan kami mencakup penjualan produk, pengelolaan keranjang belanja, checkout, dan tracking pesanan.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">3. Penggunaan Layanan</h3>
                <ul class="list-disc list-inside text-gray-600 mb-4 space-y-1">
                    <li>Anda dapat menjelajahi produk tanpa perlu mendaftar akun</li>
                    <li>Pembelian dapat dilakukan tanpa login</li>
                    <li>Data pribadi (nama, telepon, alamat) diisi saat checkout</li>
                    <li>Pembayaran dilakukan melalui transfer bank</li>
                    <li>Bukti pembayaran diupload melalui halaman tracking pesanan</li>
                </ul>

                <h3 class="text-xl font-medium text-gray-700 mb-2">4. Proses Pembelian</h3>
                <ol class="list-decimal list-inside text-gray-600 mb-4 space-y-1">
                    <li>Pilih produk dan tambahkan ke keranjang</li>
                    <li>Lakukan checkout dengan mengisi data pengiriman</li>
                    <li>Bayar melalui transfer ke rekening yang ditentukan</li>
                    <li>Upload bukti pembayaran di halaman tracking</li>
                    <li>Pesanan akan diproses setelah pembayaran dikonfirmasi</li>
                </ol>

                <h3 class="text-xl font-medium text-gray-700 mb-2">5. Pembayaran</h3>
                <p class="text-gray-600 mb-4">
                    Pembayaran dilakukan melalui transfer bank. Anda memiliki batas waktu tertentu (default 1 jam) untuk menyelesaikan pembayaran. Pesanan yang tidak dibayar dalam waktu tersebut akan otomatis dibatalkan dan stok dikembalikan.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">6. Pengiriman</h3>
                <p class="text-gray-600 mb-4">
                    Pengiriman dilakukan melalui layanan pengiriman yang tersedia. Biaya dan estimasi waktu pengiriman akan ditampilkan saat checkout. Kami akan berkoordinasi dengan Anda untuk proses pengiriman.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">7. Pembatalan dan Pengembalian</h3>
                <p class="text-gray-600 mb-4">
                    Pesanan dapat dibatalkan jika belum diproses. Untuk pengembalian produk, hubungi kami melalui informasi kontak yang tersedia. Pengembalian akan dievaluasi berdasarkan kondisi produk dan kebijakan kami.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">8. Tanggung Jawab</h3>
                <p class="text-gray-600 mb-4">
                    Soeka Mitra Grosir berusaha memberikan layanan terbaik, namun kami tidak bertanggung jawab atas kerugian yang timbul dari penggunaan layanan ini di luar kendali kami.
                </p>
            </div>
        </section>

        <!-- Kebijakan Privasi -->
        <section>
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Kebijakan Privasi</h2>

            <div class="prose prose-gray max-w-none">
                <h3 class="text-xl font-medium text-gray-700 mb-2">1. Pengumpulan Data</h3>
                <p class="text-gray-600 mb-4">
                    Kami mengumpulkan data pribadi yang Anda berikan saat melakukan checkout, termasuk nama, nomor telepon, alamat pengiriman, dan informasi pembayaran. Data ini diperlukan untuk memproses pesanan Anda.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">2. Penggunaan Data</h3>
                <ul class="list-disc list-inside text-gray-600 mb-4 space-y-1">
                    <li>Memproses dan mengirimkan pesanan</li>
                    <li>Mengkonfirmasi pembayaran</li>
                    <li>Menyediakan layanan pelanggan</li>
                    <li>Meningkatkan kualitas layanan kami</li>
                    <li>Mematuhi persyaratan hukum</li>
                </ul>

                <h3 class="text-xl font-medium text-gray-700 mb-2">3. Penyimpanan Data</h3>
                <p class="text-gray-600 mb-4">
                    Data Anda disimpan dengan aman di database kami. Kami menerapkan langkah-langkah keamanan untuk melindungi data dari akses yang tidak sah.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">4. Berbagi Data</h3>
                <p class="text-gray-600 mb-4">
                    Kami tidak menjual atau menyewakan data pribadi Anda kepada pihak ketiga. Data hanya dibagikan kepada penyedia layanan pengiriman yang diperlukan untuk menyelesaikan pesanan Anda.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">5. Hak Anda</h3>
                <p class="text-gray-600 mb-4">
                    Anda memiliki hak untuk mengakses, memperbarui, atau menghapus data pribadi Anda. Untuk permintaan terkait data, hubungi kami melalui informasi kontak yang tersedia.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">6. Cookies</h3>
                <p class="text-gray-600 mb-4">
                    Website kami menggunakan cookies untuk menyimpan keranjang belanja dan preferensi pengguna. Cookies ini membantu meningkatkan pengalaman berbelanja Anda.
                </p>

                <h3 class="text-xl font-medium text-gray-700 mb-2">7. Perubahan Kebijakan</h3>
                <p class="text-gray-600 mb-4">
                    Kami dapat memperbarui kebijakan privasi ini sewaktu-waktu. Perubahan akan diberitahukan melalui website kami.
                </p>
            </div>
        </section>

        <!-- Kontak -->
        <section>
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Kontak Kami</h2>
            <p class="text-gray-600">
                Jika Anda memiliki pertanyaan tentang ketentuan penggunaan atau kebijakan privasi ini, silakan hubungi kami melalui:
            </p>
            <div class="mt-4 text-gray-600">
                <p>Email: soekamitragrosir@gmail.com</p>
                <p>Telepon: 0895600060506</p>
                <p>Alamat: Vanya Park Cluster Azura Blok C19/36, Desa/Kelurahan Pagedangan, Kec. Pagedangan, Kab. Tangerang, Provinsi Banten, Kode Pos: 15336</p>
            </div>
        </section>
    </div>
</div>
@endsection