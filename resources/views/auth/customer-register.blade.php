@extends('layouts.app')
@section('title', 'Daftar Pelanggan')

@section('content')
<div class="min-h-[60vh] flex items-center justify-center px-4 py-12">
    <div class="w-full max-w-md">
        <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-7 sm:p-8">
            <div class="text-center mb-7">
                <div class="w-12 h-12 bg-green-600 rounded-xl flex items-center justify-center mx-auto mb-3">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM5 21a7 7 0 0 1 14 0m4-11v6m3-3h-6"/>
                    </svg>
                </div>
                <h1 class="text-2xl font-bold text-gray-900">Daftar Pelanggan</h1>
                <p class="mt-2 text-sm text-gray-500">Buat akun untuk mengakses profil dan riwayat pesanan.</p>
            </div>

            <form method="POST" action="{{ route('customer.register.submit') }}" class="space-y-5">
                @csrf
                <div>
                    <label for="register_name" class="form-label">Nama Lengkap</label>
                    <input id="register_name" type="text" name="name" value="{{ old('name') }}" required autofocus autocomplete="name" class="form-control">
                    @error('name') <p class="form-error">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label for="register_email" class="form-label">Email</label>
                    <input id="register_email" type="email" name="email" value="{{ old('email') }}" required autocomplete="email" class="form-control">
                    @error('email') <p class="form-error">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label for="register_password" class="form-label">Password</label>
                    <input id="register_password" type="password" name="password" required autocomplete="new-password" class="form-control">
                    <p class="mt-1 text-xs text-gray-400">Minimal 8 karakter.</p>
                    @error('password') <p class="form-error">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label for="register_password_confirmation" class="form-label">Konfirmasi Password</label>
                    <input id="register_password_confirmation" type="password" name="password_confirmation" required autocomplete="new-password" class="form-control">
                </div>

                <button type="submit" class="w-full rounded-xl bg-green-600 px-5 py-3 font-semibold text-white hover:bg-green-700 transition">Buat Akun</button>
            </form>

            <p class="mt-6 text-center text-sm text-gray-500">
                Sudah memiliki akun?
                <a href="{{ route('login') }}" class="font-semibold text-green-700 hover:text-green-800">Masuk</a>
            </p>
        </div>
    </div>
</div>
@endsection
