@extends('layouts.app')
@section('title', 'Hubungi Kami')

@section('content')
<section class="max-w-5xl mx-auto px-4 sm:px-6 py-12 sm:py-16">
    <div class="text-center">
        <p class="text-sm font-semibold uppercase tracking-widest text-green-600">Layanan Pelanggan</p>
        <h1 class="mt-2 text-4xl sm:text-5xl font-bold text-green-900">Hubungi Kami</h1>
        <p class="mt-4 text-gray-600">Sampaikan pertanyaan atau kebutuhan Anda. Tim kami akan segera menindaklanjuti pesan tersebut.</p>
    </div>

    <div class="mt-10 grid lg:grid-cols-[280px_1fr] gap-7">
        <aside class="rounded-2xl bg-green-800 text-white p-7">
            <h2 class="text-xl font-semibold">Informasi Kontak</h2>
            <div class="mt-7 space-y-6 text-sm">
                <div>
                    <p class="font-medium text-green-100">Telepon/WhatsApp</p>
                    <p class="mt-1">{{ setting('store_phone') }}</p>
                </div>
                <div>
                    <p class="font-medium text-green-100">Email</p>
                    <p class="mt-1 break-all">{{ setting('store_email') }}</p>
                </div>
                <div>
                    <p class="font-medium text-green-100">Alamat</p>
                    <p class="mt-1 leading-6">{{ setting('store_address') }}</p>
                </div>
            </div>
        </aside>

        <form action="{{ route('pages.contact.submit') }}" method="POST" class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6 sm:p-8 space-y-5">
            @csrf
            <div>
                <label for="contact_name" class="form-label">Nama</label>
                <input id="contact_name" type="text" name="name" value="{{ old('name') }}" placeholder="Nama lengkap Anda" required class="form-control">
                @error('name') <p class="form-error">{{ $message }}</p> @enderror
            </div>
            <div>
                <label for="contact_email" class="form-label">Email</label>
                <input id="contact_email" type="email" name="email" value="{{ old('email') }}" placeholder="nama@email.com" required class="form-control">
                @error('email') <p class="form-error">{{ $message }}</p> @enderror
            </div>
            <div>
                <label for="contact_message" class="form-label">Pesan</label>
                <textarea id="contact_message" name="message" rows="7" placeholder="Tulis pesan Anda" required class="form-control">{{ old('message') }}</textarea>
                @error('message') <p class="form-error">{{ $message }}</p> @enderror
            </div>
            <button type="submit" class="w-full rounded-xl bg-green-600 px-5 py-3.5 font-semibold text-white hover:bg-green-700 transition">Kirim Pesan</button>
        </form>
    </div>
</section>
@endsection
