@extends('layouts.app')
@section('title', 'Login Admin')

@section('content')
<div class="min-h-[60vh] flex items-center justify-center px-4">
    <div class="w-full max-w-md">
        <div class="bg-white rounded-xl border border-gray-100 p-8">
            <div class="text-center mb-6">
                <div class="w-12 h-12 bg-green-600 rounded-xl flex items-center justify-center mx-auto mb-3">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/></svg>
                </div>
                <h1 class="text-xl font-bold text-gray-900">Login Admin</h1>
            </div>

            <form method="POST" action="{{ route('admin.login.submit') }}">
                @csrf
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                        <input type="email" name="email" value="{{ old('email') }}" required autofocus class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                        @error('email') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <input type="password" name="password" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                    </div>
                    <div class="flex items-center">
                        <input type="checkbox" name="remember" id="remember" class="rounded border-gray-300 text-green-600 focus:ring-green-500">
                        <label for="remember" class="ml-2 text-sm text-gray-600">Ingat saya</label>
                    </div>
                    <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 rounded-lg transition">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
