@extends('layouts.app')
@section('title', 'Semua Produk')

@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    {{-- Search & Filter --}}
    <div class="mb-8">
        <h1 class="text-2xl font-bold text-gray-900 mb-4">Produk Sembako</h1>
        <form action="{{ route('products.index') }}" method="GET" class="flex flex-col sm:flex-row gap-3">
            <div class="flex-1">
                <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari produk..." class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
            </div>
            <select name="category" onchange="this.form.submit()" class="border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none bg-white">
                <option value="">Semua Kategori</option>
                @foreach($categories as $cat)
                    <option value="{{ $cat->slug }}" {{ request('category') === $cat->slug ? 'selected' : '' }}>{{ $cat->name }} ({{ $cat->products_count }})</option>
                @endforeach
            </select>
            <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">Cari</button>
            @if(request('search') || request('category'))
                <a href="{{ route('products.index') }}" class="text-sm text-gray-500 hover:text-gray-700 px-4 py-2.5 border border-gray-200 rounded-lg text-center">Reset</a>
            @endif
        </form>
    </div>

    {{-- Products Grid --}}
    <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4 sm:gap-6">
        @forelse($products as $product)
            <div class="bg-white rounded-xl border border-gray-100 overflow-hidden hover:shadow-md transition group">
                <a href="{{ route('products.show', $product->slug) }}">
                    <div class="aspect-square bg-gray-100 overflow-hidden">
                        @if($product->image)
                            <img src="{{ asset('uploads/' . $product->image) }}" alt="{{ $product->name }}" class="w-full h-full object-cover group-hover:scale-105 transition duration-300">
                        @else
                            <div class="w-full h-full flex items-center justify-center text-gray-300">
                                <svg class="w-16 h-16" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                            </div>
                        @endif
                    </div>
                </a>
                <div class="p-3 sm:p-4">
                    <a href="{{ route('products.show', $product->slug) }}" class="text-sm font-medium text-gray-900 hover:text-green-600 line-clamp-2">{{ $product->name }}</a>
                    <p class="text-xs text-gray-400 mt-1">{{ $product->category->name ?? '' }}</p>
                    <p class="text-xs text-gray-400 mt-1">Stok: {{ $product->stock }}</p>
                    <div class="flex items-center justify-between mt-3">
                        <span class="text-sm font-bold text-green-600">{{ format_rupiah($product->price) }}</span>
                    </div>
                    <form action="{{ route('cart.add') }}" method="POST" class="mt-3">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white text-xs font-medium py-2 px-3 rounded-lg transition">
                            + Keranjang
                        </button>
                    </form>
                </div>
            </div>
        @empty
            <div class="col-span-full text-center py-16 text-gray-400">
                <svg class="w-16 h-16 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
                <p class="text-lg font-medium">Produk tidak ditemukan</p>
                <p class="text-sm mt-1">Coba ubah kata kunci pencarian Anda</p>
            </div>
        @endforelse
    </div>

    {{-- Pagination --}}
    <div class="mt-8">
        {{ $products->links() }}
    </div>
</div>
@endsection
