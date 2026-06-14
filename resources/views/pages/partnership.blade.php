@extends('layouts.app')
@section('title', 'Kerjasama')

@section('content')
<section class="bg-gradient-to-r from-green-900 via-green-700 to-green-500 text-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 py-16 sm:py-24">
        <div class="max-w-3xl">
            <p class="text-sm font-semibold uppercase tracking-[0.25em] text-green-100">Program Kemitraan</p>
            <h1 class="mt-4 text-4xl sm:text-6xl font-bold leading-tight">Raih Banyak Keuntungan Bekerjasama Dengan Kami</h1>
            <p class="mt-5 text-green-50 text-lg leading-8">Solusi pasokan kebutuhan pokok untuk bisnis, rumah tangga, toko, dan mitra produksi.</p>
            <a href="#form-kerjasama" class="inline-flex mt-8 items-center rounded-lg bg-white px-5 py-3 text-sm font-semibold text-green-700 hover:bg-green-50 transition">Ajukan Kerjasama</a>
        </div>
    </div>
</section>

@php
    $programs = [
        [
            'title' => 'Horeka (Hotel, Restoran & Katering)',
            'description' => 'Layanan pasokan kebutuhan bahan baku bagi hotel, restoran, dan katering dengan jumlah, jadwal pengiriman, serta sistem pembayaran yang dapat disesuaikan.',
            'points' => ['Harga grosir sesuai volume pesanan', 'Pasokan dari jaringan pemasok terpercaya', 'Jadwal order dan pengiriman yang fleksibel', 'Garansi penanganan produk bermasalah', 'Skema pesan, antar, lalu bayar sesuai kesepakatan'],
            'icon' => 'building',
        ],
        [
            'title' => 'Membuka Usaha Jualan Kebutuhan Pokok',
            'description' => 'Kami membantu calon pelaku usaha memahami produk, cara berjualan, memilih lokasi, menata ruang, menentukan produk unggulan, dan menganalisis prospek usaha.',
            'points' => ['Pilihan bimbingan sesuai kebutuhan', 'Akses harga grosir dengan ketentuan kerja sama berkala'],
            'icon' => 'store',
        ],
        [
            'title' => 'Layanan untuk Supermarket & Swalayan',
            'description' => 'Pasokan berbagai kebutuhan pokok dengan kualitas yang diseleksi untuk memenuhi kebutuhan operasional supermarket dan swalayan.',
            'points' => ['Pilihan produk dan kuantitas fleksibel', 'Pengiriman terjadwal', 'Penanganan retur sesuai kesepakatan'],
            'icon' => 'cart',
        ],
        [
            'title' => 'Paket Langganan Rumah Tangga',
            'description' => 'Paket kebutuhan rumah tangga yang dikirim rutin dengan jadwal dan daftar produk yang dapat disesuaikan.',
            'points' => ['Belanja rutin lebih praktis', 'Paket sesuai kebutuhan keluarga', 'Pembayaran dan pengiriman terjadwal'],
            'icon' => 'home',
        ],
        [
            'title' => 'Langganan Grosir untuk Toko',
            'description' => 'Program pasokan bagi toko yang membutuhkan ketersediaan produk untuk dijual kembali dengan harga dan kuantitas grosir.',
            'points' => ['Harga kompetitif dari jaringan pemasok', 'Ketersediaan produk lebih terjaga', 'Kualitas sesuai pesanan', 'Pemesanan dapat dikoordinasikan secara langsung'],
            'icon' => 'shop',
        ],
        [
            'title' => 'Menjadi Mitra Pemasok',
            'description' => 'Kami membuka peluang bagi produsen, petani, distributor, dan pemasok untuk menjangkau pasar yang lebih luas melalui kerja sama pasokan yang transparan.',
            'points' => ['Kebutuhan produk dikomunikasikan dengan jelas', 'Skema kualitas dan harga disepakati bersama', 'Peluang kerja sama berkelanjutan'],
            'icon' => 'users',
        ],
    ];
@endphp

<section class="bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 py-14 sm:py-20 space-y-14">
        @foreach($programs as $program)
            <article class="grid md:grid-cols-[1fr_280px] gap-8 md:gap-14 items-center {{ $loop->even ? 'md:[&>*:first-child]:order-2' : '' }}">
                <div>
                    <h2 class="text-2xl sm:text-3xl font-bold text-green-900">{{ $program['title'] }}</h2>
                    <p class="mt-4 text-gray-600 leading-7">{{ $program['description'] }}</p>
                    <ul class="mt-5 grid sm:grid-cols-2 gap-3">
                        @foreach($program['points'] as $point)
                            <li class="flex gap-3 text-sm text-gray-600">
                                <svg class="w-5 h-5 text-green-600 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m5 13 4 4L19 7"/></svg>
                                <span>{{ $point }}</span>
                            </li>
                        @endforeach
                    </ul>
                </div>
                <div class="rounded-3xl bg-green-50 border border-green-100 min-h-56 flex items-center justify-center text-green-700">
                    @if($program['icon'] === 'building')
                        <svg class="w-24 h-24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 21h18M6 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16M9 7h2m2 0h2M9 11h2m2 0h2M9 15h2m2 0h2"/></svg>
                    @elseif($program['icon'] === 'home')
                        <svg class="w-24 h-24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m3 11 9-8 9 8v10H3V11Zm6 10v-6h6v6"/></svg>
                    @elseif($program['icon'] === 'users')
                        <svg class="w-24 h-24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2m7-10a4 4 0 1 0 0-8 4 4 0 0 0 0 8Zm13 10v-2a4 4 0 0 0-3-3.87m-2-12a4 4 0 0 1 0 7.75"/></svg>
                    @else
                        <svg class="w-24 h-24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M3 9h18l-1-5H4L3 9Zm1 0v11h16V9M8 20v-6h8v6"/></svg>
                    @endif
                </div>
            </article>
        @endforeach
    </div>
</section>

<section id="form-kerjasama" class="bg-green-50 border-y border-green-100 scroll-mt-20">
    <div class="max-w-5xl mx-auto px-4 sm:px-6 py-14 sm:py-20">
        <div class="text-center mb-10">
            <p class="text-sm font-semibold uppercase tracking-widest text-green-600">Mari Berdiskusi</p>
            <h2 class="mt-2 text-3xl sm:text-4xl font-bold text-green-900">Hubungi Kami Melalui Form Ini</h2>
            <p class="mt-4 text-gray-600">Isi form berikut. Tim kami akan merespons melalui WhatsApp, telepon, atau email.</p>
        </div>

        <form action="{{ route('pages.partnership.submit') }}" method="POST" class="bg-white rounded-2xl border border-green-100 shadow-sm p-6 sm:p-8 space-y-5">
            @csrf
            <div>
                <label for="partnership_type" class="form-label">Pilihan Anda terhubung dengan kami sebagai?</label>
                <select id="partnership_type" name="partnership_type" required class="form-control">
                    <option value="">Pilih jenis kerjasama</option>
                    <option value="horeka" @selected(old('partnership_type') === 'horeka')>Horeka (Hotel, Restoran & Katering)</option>
                    <option value="usaha-buah-sayur" @selected(old('partnership_type') === 'usaha-buah-sayur')>Membuka usaha jualan kebutuhan pokok</option>
                    <option value="supermarket" @selected(old('partnership_type') === 'supermarket')>Supermarket & Swalayan</option>
                    <option value="rumah-tangga" @selected(old('partnership_type') === 'rumah-tangga')>Paket langganan rumah tangga</option>
                    <option value="toko-buah" @selected(old('partnership_type') === 'toko-buah')>Langganan grosir untuk toko</option>
                    <option value="mitra-bertani" @selected(old('partnership_type') === 'mitra-bertani')>Menjadi mitra pemasok</option>
                </select>
                @error('partnership_type') <p class="form-error">{{ $message }}</p> @enderror
            </div>

            <div class="grid sm:grid-cols-2 gap-5">
                <div>
                    <label for="partnership_name" class="form-label">Nama Anda</label>
                    <input id="partnership_name" type="text" name="name" value="{{ old('name') }}" placeholder="Nama lengkap Anda" required class="form-control">
                    @error('name') <p class="form-error">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label for="business_name" class="form-label">Nama Usaha</label>
                    <input id="business_name" type="text" name="business_name" value="{{ old('business_name') }}" placeholder="Nama resmi usaha" required class="form-control">
                    @error('business_name') <p class="form-error">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label for="partnership_email" class="form-label">Email</label>
                    <input id="partnership_email" type="email" name="email" value="{{ old('email') }}" placeholder="nama@email.com" required class="form-control">
                    @error('email') <p class="form-error">{{ $message }}</p> @enderror
                </div>
                <div>
                    <label for="phone" class="form-label">No. HP/WhatsApp</label>
                    <input id="phone" type="tel" name="phone" value="{{ old('phone') }}" placeholder="08xxxxxxxxxx" required class="form-control">
                    @error('phone') <p class="form-error">{{ $message }}</p> @enderror
                </div>
            </div>

            <div>
                <label for="partnership_message" class="form-label">Apa yang Anda harapkan dari kami?</label>
                <textarea id="partnership_message" name="message" rows="6" placeholder="Jelaskan kebutuhan Anda dengan detail" required class="form-control">{{ old('message') }}</textarea>
                @error('message') <p class="form-error">{{ $message }}</p> @enderror
            </div>

            <button type="submit" class="w-full rounded-xl bg-green-600 px-5 py-3.5 font-semibold text-white hover:bg-green-700 transition">Kirim Permintaan</button>
        </form>
    </div>
</section>
@endsection
