@extends('layouts.app')
@section('title', 'Penukaran dan Pengembalian')

@section('content')
<x-legal-page
    title="Penukaran dan Pengembalian"
    intro="Kami berkomitmen mengirimkan produk dalam kondisi baik. Jika produk yang diterima tidak sesuai, ikuti ketentuan dan prosedur berikut agar keluhan dapat kami tangani."
>
    <section>
        <h2>1. Produk yang Dapat Ditukar atau Dikembalikan</h2>
        <ul>
            <li>Produk rusak, bocor, pecah, atau tidak layak saat diterima.</li>
            <li>Jenis atau jumlah produk tidak sesuai dengan pesanan.</li>
            <li>Kemasan rusak berat sehingga memengaruhi kualitas produk.</li>
            <li>Produk telah melewati tanggal kedaluwarsa ketika diterima.</li>
        </ul>
    </section>

    <section>
        <h2>2. Kondisi yang Tidak Dapat Diklaim</h2>
        <ul>
            <li>Produk telah dibuka, digunakan, atau dikonsumsi sebagian tanpa bukti kerusakan awal.</li>
            <li>Kerusakan terjadi akibat penyimpanan atau penanganan yang tidak tepat setelah diterima.</li>
            <li>Pengembalian dilakukan karena perubahan selera atau tidak lagi membutuhkan produk.</li>
            <li>Keluhan disampaikan melewati batas waktu pelaporan.</li>
        </ul>
    </section>

    <section>
        <h2>3. Prosedur Pengajuan</h2>
        <ol>
            <li>Laporkan keluhan maksimal 24 jam setelah pesanan diterima melalui halaman <a href="{{ route('pages.contact') }}">Hubungi Kami</a> atau telepon/WhatsApp {{ setting('store_phone') }}.</li>
            <li>Sertakan nomor pesanan, foto produk dan kemasan, serta penjelasan kondisi produk.</li>
            <li>Tim kami akan melakukan verifikasi paling lambat 1x24 jam setelah bukti diterima.</li>
            <li>Jika disetujui, kami akan menawarkan penggantian produk atau pengembalian dana.</li>
        </ol>
    </section>

    <section>
        <h2>4. Pesanan Grosir</h2>
        <p>Untuk pesanan grosir, keluhan wajib diajukan sebelum seluruh kemasan dibuka. Mohon simpan label, kemasan asli, dan dokumentasi penerimaan. Verifikasi pesanan dalam jumlah besar dapat memerlukan waktu hingga 2x24 jam.</p>
    </section>

    <section>
        <h2>5. Penggantian Produk dan Pengembalian Dana</h2>
        <p>Produk pengganti akan dikirim berdasarkan ketersediaan stok dan kesepakatan pengiriman. Pengembalian dana diproses ke rekening yang disepakati setelah klaim disetujui dan dapat memerlukan waktu 3-5 hari kerja.</p>
    </section>

    <section>
        <h2>6. Biaya Pengembalian</h2>
        <p>Biaya pengiriman pengganti ditanggung {{ setting('store_name') }} apabila kesalahan berasal dari pihak kami. Biaya dapat dibebankan kepada pembeli apabila klaim tidak memenuhi ketentuan di atas.</p>
    </section>
</x-legal-page>
@endsection
