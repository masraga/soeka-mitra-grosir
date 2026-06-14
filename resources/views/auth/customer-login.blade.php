@extends('layouts.app')
@section('title', 'Login Pelanggan')

@section('content')
<div class="min-h-[60vh] flex items-center justify-center px-4 py-12">
    <div class="w-full max-w-md">
        <div class="bg-white rounded-2xl border border-gray-100 shadow-sm p-7 sm:p-8">
            <div class="text-center mb-7">
                <div class="w-12 h-12 bg-green-600 rounded-xl flex items-center justify-center mx-auto mb-3">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM5 21a7 7 0 0 1 14 0"/>
                    </svg>
                </div>
                <h1 class="text-2xl font-bold text-gray-900">Login Pelanggan</h1>
                <p class="mt-2 text-sm text-gray-500">Masuk untuk membuka akun dan riwayat pesanan Anda.</p>
            </div>

            <form method="POST" action="{{ route('customer.login.submit') }}" class="space-y-5">
                @csrf
                <div>
                    <label for="customer_login_email" class="form-label">Email</label>
                    <input id="customer_login_email" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="email" class="form-control">
                    @error('email') <p class="form-error">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label for="customer_login_password" class="form-label">Password</label>
                    <input id="customer_login_password" type="password" name="password" required autocomplete="current-password" class="form-control">
                    @error('password') <p class="form-error">{{ $message }}</p> @enderror
                </div>

                <label class="flex items-center gap-2 text-sm text-gray-600">
                    <input type="checkbox" name="remember" class="rounded border-gray-300 text-green-600 focus:ring-green-500">
                    <span>Ingat saya</span>
                </label>

                <button type="submit" class="w-full rounded-xl bg-green-600 px-5 py-3 font-semibold text-white hover:bg-green-700 transition">Masuk</button>
            </form>

            <p class="mt-6 text-center text-sm text-gray-500">
                Belum memiliki akun?
                <a href="{{ route('register') }}" class="font-semibold text-green-700 hover:text-green-800">Daftar sekarang</a>
            </p>
        </div>
    </div>
</div>
@endsection
