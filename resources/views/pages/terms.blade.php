@extends('layouts.app')
@section('title', 'Syarat dan Ketentuan')

@section('content')
<x-legal-page
    title="Syarat dan Ketentuan"
    :intro="'Syarat dan Ketentuan ini mengatur penggunaan website dan layanan '.setting('store_name').'. Dengan menggunakan layanan kami, Anda dianggap telah membaca, memahami, dan menyetujui ketentuan berikut.'"
>
    <section>
        <h2>1. Pengertian Umum</h2>
        <p>{{ setting('store_name') }} adalah platform e-commerce yang menyediakan produk sembako dan kebutuhan pokok untuk kebutuhan rumah tangga maupun usaha. “Pengguna” adalah setiap individu atau badan usaha yang mengakses layanan kami, sedangkan “Produk” adalah barang yang ditawarkan melalui website {{ setting('store_name') }}.</p>
    </section>

    <section>
        <h2>2. Penggunaan Layanan</h2>
        <ul>
            <li>Pengguna dapat bertransaksi sebagai tamu tanpa membuat akun.</li>
            <li>Data yang diberikan saat checkout harus akurat, lengkap, dan dapat dihubungi.</li>
            <li>Pengguna wajib berusia minimal 18 tahun atau memperoleh izin wali yang sah.</li>
            <li>Pengguna bertanggung jawab atas seluruh informasi yang diberikan dalam pesanan.</li>
        </ul>
    </section>

    <section>
        <h2>3. Pemesanan dan Pembayaran</h2>
        <p>Pesanan dianggap diterima setelah checkout berhasil. Pembayaran dilakukan melalui metode yang tersedia pada halaman checkout dan harus diselesaikan sebelum batas waktu yang tercantum. Pesanan yang belum dibayar sampai batas waktu dapat dibatalkan secara otomatis.</p>
        <p>Harga, stok, promosi, dan biaya lain dapat berubah sewaktu-waktu. Harga yang berlaku adalah harga yang ditampilkan saat pesanan dibuat.</p>
    </section>

    <section>
        <h2>4. Pengiriman</h2>
        <ul>
            <li>Biaya dan estimasi pengiriman ditampilkan saat checkout atau dikonfirmasi oleh tim kami.</li>
            <li>Pengguna wajib memastikan alamat dan nomor telepon penerima sudah benar.</li>
            <li>Keterlambatan akibat kurir, cuaca, force majeure, atau alamat yang tidak lengkap berada di luar kendali langsung kami.</li>
        </ul>
    </section>

    <section>
        <h2>5. Kebijakan Produk</h2>
        <p>Kami berupaya menjaga kualitas produk sesuai deskripsi. Perbedaan warna atau tampilan dapat terjadi karena pencahayaan, perangkat, dan karakter alami produk. Penukaran atau pengembalian hanya berlaku sesuai <a href="{{ route('pages.returns') }}">Kebijakan Penukaran dan Pengembalian</a>.</p>
    </section>

    <section>
        <h2>6. Pembatalan Pesanan</h2>
        <p>Pembatalan dapat diminta sebelum pesanan diproses. Pesanan yang telah diproses atau dikirim tidak dapat dibatalkan, kecuali disepakati lain oleh {{ setting('store_name') }}.</p>
    </section>

    <section>
        <h2>7. Hak Kekayaan Intelektual</h2>
        <p>Logo, gambar, teks, desain, dan seluruh konten website merupakan milik {{ setting('store_name') }} atau digunakan berdasarkan izin. Penggunaan untuk kepentingan komersial tanpa persetujuan tertulis dilarang.</p>
    </section>

    <section>
        <h2>8. Pembatasan Tanggung Jawab</h2>
        <p>{{ setting('store_name') }} tidak bertanggung jawab atas kerugian yang timbul akibat informasi pengguna yang keliru, penyimpanan produk yang tidak tepat setelah diterima, gangguan pihak ketiga, atau keadaan di luar kendali yang wajar.</p>
    </section>

    <section>
        <h2>9. Perubahan dan Penyelesaian Sengketa</h2>
        <p>Ketentuan ini dapat diperbarui sewaktu-waktu. Perselisihan akan diupayakan selesai melalui musyawarah dan, apabila tidak tercapai kesepakatan, diselesaikan berdasarkan hukum Republik Indonesia.</p>
    </section>

    <section>
        <h2>10. Hubungi Kami</h2>
        <p>Pertanyaan mengenai ketentuan ini dapat disampaikan melalui halaman <a href="{{ route('pages.contact') }}">Hubungi Kami</a>, email {{ setting('store_email') }}, telepon {{ setting('store_phone') }}, atau alamat {{ setting('store_address') }}.</p>
    </section>
</x-legal-page>
@endsection
