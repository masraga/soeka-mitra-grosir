@extends('layouts.app')
@section('title', 'Kebijakan Privasi')

@section('content')
<x-legal-page
    title="Kebijakan Privasi"
    :intro="'Kebijakan ini menjelaskan cara '.setting('store_name').' mengumpulkan, menggunakan, menyimpan, dan melindungi data pribadi ketika Anda menggunakan website dan layanan kami.'"
>
    <section>
        <h2>1. Data yang Kami Kumpulkan</h2>
        <p>Kami dapat mengumpulkan nama, email, nomor telepon, alamat pengiriman, detail pesanan, bukti pembayaran, komunikasi dengan layanan pelanggan, alamat IP, jenis perangkat, serta data cookies yang diperlukan untuk menjalankan website.</p>
    </section>

    <section>
        <h2>2. Cara Data Dikumpulkan</h2>
        <ul>
            <li>Saat Anda melakukan checkout, melacak pesanan, atau mengunggah bukti pembayaran.</li>
            <li>Saat Anda mengisi form kerjasama atau menghubungi kami.</li>
            <li>Secara otomatis melalui cookies, log server, dan teknologi sejenis.</li>
        </ul>
    </section>

    <section>
        <h2>3. Penggunaan Data</h2>
        <ul>
            <li>Memproses pembayaran, pesanan, pengiriman, penukaran, dan pengembalian.</li>
            <li>Menghubungi Anda terkait transaksi atau permintaan yang diajukan.</li>
            <li>Mencegah penipuan, menjaga keamanan, dan meningkatkan kualitas layanan.</li>
            <li>Memenuhi kewajiban hukum yang berlaku.</li>
        </ul>
    </section>

    <section>
        <h2>4. Penyimpanan dan Keamanan</h2>
        <p>Kami menerapkan langkah teknis dan organisasi yang wajar untuk melindungi data dari akses, perubahan, pengungkapan, atau kehilangan tanpa izin. Data disimpan selama diperlukan untuk tujuan transaksi, operasional, dan kewajiban hukum.</p>
    </section>

    <section>
        <h2>5. Pembagian Data</h2>
        <p>Kami tidak menjual atau menyewakan data pribadi. Data dapat dibagikan secara terbatas kepada penyedia pembayaran, jasa pengiriman, penyedia infrastruktur, penasihat profesional, atau pihak berwenang apabila diwajibkan hukum.</p>
    </section>

    <section>
        <h2>6. Cookies</h2>
        <p>Cookies digunakan untuk menyimpan keranjang belanja, menjaga sesi, dan memahami penggunaan website. Anda dapat membatasi cookies melalui browser, tetapi beberapa fitur mungkin tidak berfungsi dengan baik.</p>
    </section>

    <section>
        <h2>7. Hak Anda</h2>
        <p>Anda dapat meminta akses, koreksi, atau penghapusan data pribadi sepanjang tidak bertentangan dengan kewajiban penyimpanan berdasarkan hukum. Permintaan dapat diajukan melalui halaman <a href="{{ route('pages.contact') }}">Hubungi Kami</a>.</p>
    </section>

    <section>
        <h2>8. Perubahan Kebijakan</h2>
        <p>Kebijakan ini dapat diperbarui sesuai perkembangan layanan dan peraturan. Versi terbaru selalu tersedia pada halaman ini.</p>
    </section>

    <section>
        <h2>9. Kontak</h2>
        <p>Pertanyaan terkait privasi dapat disampaikan ke {{ setting('store_email') }}, melalui telepon {{ setting('store_phone') }}, atau ke alamat {{ setting('store_address') }}.</p>
    </section>
</x-legal-page>
@endsection
