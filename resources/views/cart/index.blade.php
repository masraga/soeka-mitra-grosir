@extends('layouts.app')
@section('title', 'Keranjang Belanja')

@section('content')
<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h1 class="text-2xl font-bold text-gray-900 mb-6">Keranjang Belanja</h1>

    @if(count($cart) > 0)
        <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
            <div class="divide-y divide-gray-100">
                @foreach($cart as $id => $item)
                <div class="flex items-center p-4 gap-4">
                    {{-- Image --}}
                    <div class="w-16 h-16 sm:w-20 sm:h-20 bg-gray-100 rounded-lg overflow-hidden shrink-0">
                        @if($item['image'])
                            <img src="{{ asset('storage/' . $item['image']) }}" alt="{{ $item['name'] }}" class="w-full h-full object-cover">
                        @else
                            <div class="w-full h-full flex items-center justify-center text-gray-300">
                                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/></svg>
                            </div>
                        @endif
                    </div>

                    {{-- Info --}}
                    <div class="flex-1 min-w-0">
                        <h3 class="text-sm font-medium text-gray-900 truncate">{{ $item['name'] }}</h3>
                        <p class="text-sm text-green-600 font-semibold mt-1">{{ format_rupiah($item['price']) }}</p>
                    </div>

                    {{-- Quantity --}}
                    <form action="{{ route('cart.update') }}" method="POST" class="flex items-center">
                        @csrf
                        @method('PATCH')
                        <input type="hidden" name="product_id" value="{{ $id }}">
                        <div class="flex items-center border border-gray-200 rounded-lg">
                            <button type="submit" name="quantity" value="{{ max(1, $item['quantity'] - 1) }}" class="px-2.5 py-1.5 text-gray-600 hover:bg-gray-50 text-sm">−</button>
                            <span class="px-3 py-1.5 text-sm font-medium border-x border-gray-200">{{ $item['quantity'] }}</span>
                            <button type="submit" name="quantity" value="{{ $item['quantity'] + 1 }}" class="px-2.5 py-1.5 text-gray-600 hover:bg-gray-50 text-sm">+</button>
                        </div>
                    </form>

                    {{-- Subtotal --}}
                    <div class="hidden sm:block text-right w-28">
                        <p class="text-sm font-semibold text-gray-900">{{ format_rupiah($item['price'] * $item['quantity']) }}</p>
                    </div>

                    {{-- Remove --}}
                    <form action="{{ route('cart.remove') }}" method="POST">
                        @csrf
                        @method('DELETE')
                        <input type="hidden" name="product_id" value="{{ $id }}">
                        <button type="submit" class="text-gray-400 hover:text-red-500 transition p-1">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                        </button>
                    </form>
                </div>
                @endforeach
            </div>

            {{-- Total --}}
            <div class="bg-gray-50 px-4 py-4 border-t">
                <div class="flex items-center justify-between">
                    <span class="text-base font-semibold text-gray-900">Subtotal</span>
                    <span class="text-lg font-bold text-green-600">{{ format_rupiah(cart_total()) }}</span>
                </div>
            </div>
        </div>

        <div class="flex flex-col sm:flex-row justify-between items-center mt-6 gap-3">
            <form action="{{ route('cart.clear') }}" method="POST">
                @csrf
                @method('DELETE')
                <button type="submit" class="text-sm text-red-500 hover:text-red-700 transition">Kosongkan Keranjang</button>
            </form>
            <div class="flex gap-3">
                <a href="{{ route('products.index') }}" class="px-6 py-2.5 border border-gray-200 rounded-lg text-sm font-medium text-gray-700 hover:bg-gray-50 transition">Lanjut Belanja</a>
                <a href="{{ route('checkout.index') }}" class="px-6 py-2.5 bg-green-600 hover:bg-green-700 text-white rounded-lg text-sm font-medium transition">Checkout</a>
            </div>
        </div>
    @else
        <div class="text-center py-16">
            <svg class="w-20 h-20 mx-auto text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 100 4 2 2 0 000-4z"/></svg>
            <h2 class="text-lg font-semibold text-gray-900 mb-2">Keranjang Kosong</h2>
            <p class="text-sm text-gray-500 mb-6">Ayo mulai belanja sembako kebutuhanmu!</p>
            <a href="{{ route('products.index') }}" class="inline-block bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 px-6 rounded-lg transition">Mulai Belanja</a>
        </div>
    @endif
</div>
@endsection
