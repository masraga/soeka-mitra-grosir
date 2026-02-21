<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Soeka Mitra Grosir') - {{ setting('store_name', 'Soeka Mitra Grosir') }}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body class="bg-gray-50 font-sans text-gray-800 min-h-screen flex flex-col">

    {{-- Header --}}
    <header class="bg-white shadow-sm sticky top-0 z-50" x-data="{ mobileMenu: false }">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                {{-- Logo --}}
                <a href="{{ route('home') }}" class="flex items-center space-x-2">
                    <div class="w-8 h-8 bg-green-600 rounded-lg flex items-center justify-center">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 100 4 2 2 0 000-4z"/>
                        </svg>
                    </div>
                    <span class="text-lg font-bold text-gray-900">Soeka Mitra</span>
                </a>

                {{-- Desktop Nav --}}
                <nav class="hidden md:flex items-center space-x-8">
                    <a href="{{ route('home') }}" class="text-sm font-medium {{ request()->routeIs('home') ? 'text-green-600' : 'text-gray-600 hover:text-green-600' }} transition">Beranda</a>
                    <a href="{{ route('products.index') }}" class="text-sm font-medium {{ request()->routeIs('products.*') ? 'text-green-600' : 'text-gray-600 hover:text-green-600' }} transition">Produk</a>
                    <a href="{{ route('track.index') }}" class="text-sm font-medium {{ request()->routeIs('track.*') ? 'text-green-600' : 'text-gray-600 hover:text-green-600' }} transition">Lacak Pesanan</a>
                </nav>

                {{-- Cart + Mobile Toggle --}}
                <div class="flex items-center space-x-4">
                    <a href="{{ route('cart.index') }}" class="relative p-2 text-gray-600 hover:text-green-600 transition">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 100 4 2 2 0 000-4z"/>
                        </svg>
                        @if(cart_count() > 0)
                            <span class="absolute -top-1 -right-1 bg-green-600 text-white text-xs font-bold rounded-full w-5 h-5 flex items-center justify-center">{{ cart_count() }}</span>
                        @endif
                    </a>

                    <button @click="mobileMenu = !mobileMenu" class="md:hidden p-2 text-gray-600">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path x-show="!mobileMenu" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                            <path x-show="mobileMenu" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                </div>
            </div>

            {{-- Mobile Nav --}}
            <div x-show="mobileMenu" x-transition class="md:hidden pb-4 border-t">
                <a href="{{ route('home') }}" class="block py-2 text-sm font-medium text-gray-600 hover:text-green-600">Beranda</a>
                <a href="{{ route('products.index') }}" class="block py-2 text-sm font-medium text-gray-600 hover:text-green-600">Produk</a>
                <a href="{{ route('track.index') }}" class="block py-2 text-sm font-medium text-gray-600 hover:text-green-600">Lacak Pesanan</a>
            </div>
        </div>
    </header>

    {{-- Flash Messages --}}
    @if(session('success'))
        <div x-data="{ show: true }" x-show="show" x-init="setTimeout(() => show = false, 4000)" x-transition
             class="fixed top-20 right-4 z-50 bg-green-50 border border-green-200 text-green-700 px-4 py-3 rounded-lg shadow-lg max-w-sm">
            <div class="flex items-center justify-between">
                <span class="text-sm">{{ session('success') }}</span>
                <button @click="show = false" class="ml-2 text-green-500">&times;</button>
            </div>
        </div>
    @endif
    @if(session('error'))
        <div x-data="{ show: true }" x-show="show" x-init="setTimeout(() => show = false, 4000)" x-transition
             class="fixed top-20 right-4 z-50 bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg shadow-lg max-w-sm">
            <div class="flex items-center justify-between">
                <span class="text-sm">{{ session('error') }}</span>
                <button @click="show = false" class="ml-2 text-red-500">&times;</button>
            </div>
        </div>
    @endif

    {{-- Main Content --}}
    <main class="flex-1">
        @yield('content')
    </main>

    {{-- Footer --}}
    <footer class="bg-white border-t mt-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div>
                    <h3 class="text-sm font-semibold text-gray-900 mb-3">{{ setting('store_name', 'Soeka Mitra Grosir') }}</h3>
                    <p class="text-sm text-gray-500">{{ setting('store_description', 'Toko grosir sembako terpercaya') }}</p>
                </div>
                <div>
                    <h3 class="text-sm font-semibold text-gray-900 mb-3">Kontak</h3>
                    <p class="text-sm text-gray-500">{{ setting('store_phone', '-') }}</p>
                    <p class="text-sm text-gray-500">{{ setting('store_address', '-') }}</p>
                </div>
                <div>
                    <h3 class="text-sm font-semibold text-gray-900 mb-3">Menu</h3>
                    <div class="space-y-2">
                        <a href="{{ route('home') }}" class="block text-sm text-gray-500 hover:text-green-600">Beranda</a>
                        <a href="{{ route('products.index') }}" class="block text-sm text-gray-500 hover:text-green-600">Produk</a>
                        <a href="{{ route('track.index') }}" class="block text-sm text-gray-500 hover:text-green-600">Lacak Pesanan</a>
                    </div>
                </div>
            </div>
            <div class="border-t mt-8 pt-6 text-center">
                <p class="text-xs text-gray-400">&copy; {{ date('Y') }} {{ setting('store_name', 'Soeka Mitra Grosir') }}. All rights reserved.</p>
            </div>
        </div>
    </footer>

    @stack('scripts')
</body>
</html>
