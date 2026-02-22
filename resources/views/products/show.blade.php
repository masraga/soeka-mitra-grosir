@extends('layouts.app')
@section('title', $product->name)

@section('content')
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    {{-- Breadcrumb --}}
    <nav class="text-sm text-gray-500 mb-6">
        <a href="{{ route('home') }}" class="hover:text-green-600">Beranda</a>
        <span class="mx-2">/</span>
        <a href="{{ route('products.index') }}" class="hover:text-green-600">Produk</a>
        <span class="mx-2">/</span>
        <span class="text-gray-900">{{ $product->name }}</span>
    </nav>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        {{-- Product Image --}}
        <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
            <div class="aspect-square bg-gray-100">
                @if($product->image)
                    <img src="{{ asset('uploads/' . $product->image) }}" alt="{{ $product->name }}" class="w-full h-full object-cover">
                @else
                    <div class="w-full h-full flex items-center justify-center text-gray-300">
                        <svg class="w-24 h-24" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                    </div>
                @endif
            </div>
        </div>

        {{-- Product Info --}}
        <div>
            <span class="inline-block text-xs font-medium text-green-600 bg-green-50 px-3 py-1 rounded-full mb-3">{{ $product->category->name ?? '' }}</span>
            <h1 class="text-2xl font-bold text-gray-900 mb-2">{{ $product->name }}</h1>
            <p class="text-3xl font-bold text-green-600 mb-4">{{ format_rupiah($product->price) }}</p>

            <div class="flex items-center space-x-4 mb-6 text-sm">
                <span class="flex items-center {{ $product->stock > 0 ? 'text-green-600' : 'text-red-600' }}">
                    <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
                    {{ $product->stock > 0 ? 'Stok: ' . $product->stock : 'Stok Habis' }}
                </span>
            </div>

            @if($product->description)
            <div class="mb-6">
                <h3 class="text-sm font-semibold text-gray-900 mb-2">Deskripsi</h3>
                <p class="text-sm text-gray-600 leading-relaxed">{{ $product->description }}</p>
            </div>
            @endif

            @if($product->stock > 0)
            <form action="{{ route('cart.add') }}" method="POST" x-data="{ qty: 1 }">
                @csrf
                <input type="hidden" name="product_id" value="{{ $product->id }}">
                <div class="flex items-center space-x-4 mb-4">
                    <label class="text-sm font-medium text-gray-700">Jumlah:</label>
                    <div class="flex items-center border border-gray-200 rounded-lg">
                        <button type="button" @click="qty = Math.max(1, qty - 1)" class="px-3 py-2 text-gray-600 hover:bg-gray-50">−</button>
                        <input type="number" name="quantity" x-model="qty" min="1" max="{{ $product->stock }}" class="w-16 text-center border-x border-gray-200 py-2 text-sm outline-none">
                        <button type="button" @click="qty = Math.min({{ $product->stock }}, qty + 1)" class="px-3 py-2 text-gray-600 hover:bg-gray-50">+</button>
                    </div>
                </div>
                <button type="submit" class="w-full sm:w-auto bg-green-600 hover:bg-green-700 text-white font-medium py-3 px-8 rounded-lg transition">
                    Tambah ke Keranjang
                </button>
            </form>
            @else
            <button disabled class="w-full sm:w-auto bg-gray-300 text-gray-500 font-medium py-3 px-8 rounded-lg cursor-not-allowed">
                Stok Habis
            </button>
            @endif
        </div>
    </div>

    {{-- Related Products --}}
    @if($relatedProducts->count() > 0)
    <section class="mt-12">
        <h2 class="text-xl font-bold text-gray-900 mb-6">Produk Terkait</h2>
        <div class="grid grid-cols-2 sm:grid-cols-4 gap-4 sm:gap-6">
            @foreach($relatedProducts as $related)
            <div class="bg-white rounded-xl border border-gray-100 overflow-hidden hover:shadow-md transition group">
                <a href="{{ route('products.show', $related->slug) }}">
                    <div class="aspect-square bg-gray-100 overflow-hidden">
                        @if($related->image)
                            <img src="{{ asset('uploads/' . $related->image) }}" alt="{{ $related->name }}" class="w-full h-full object-cover group-hover:scale-105 transition duration-300">
                        @else
                            <div class="w-full h-full flex items-center justify-center text-gray-300">
                                <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
                            </div>
                        @endif
                    </div>
                </a>
                <div class="p-3">
                    <a href="{{ route('products.show', $related->slug) }}" class="text-sm font-medium text-gray-900 hover:text-green-600 line-clamp-2">{{ $related->name }}</a>
                    <p class="text-sm font-bold text-green-600 mt-2">{{ format_rupiah($related->price) }}</p>
                </div>
            </div>
            @endforeach
        </div>
    </section>
    @endif
</div>
@endsection
