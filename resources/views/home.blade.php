@extends('layouts.app')
@section('title', 'Beranda')

@section('content')
    {{-- Slider --}}
    @if($sliders->count() > 0)
    <section x-data="{
        current: 0,
        slides: {{ $sliders->count() }},
        autoplay: null,
        init() {
            this.autoplay = setInterval(() => { this.next() }, 5000);
        },
        next() { this.current = (this.current + 1) % this.slides },
        prev() { this.current = (this.current - 1 + this.slides) % this.slides }
    }" class="relative bg-green-700 overflow-hidden">
        <div class="relative h-64 sm:h-80 md:h-96">
            @foreach($sliders as $index => $slider)
            <div x-show="current === {{ $index }}"
                 x-transition:enter="transition ease-out duration-500"
                 x-transition:enter-start="opacity-0 transform translate-x-full"
                 x-transition:enter-end="opacity-100 transform translate-x-0"
                 x-transition:leave="transition ease-in duration-300"
                 x-transition:leave-start="opacity-100"
                 x-transition:leave-end="opacity-0"
                 class="absolute inset-0">
                @if($slider->image)
                    <img src="{{ asset('uploads/' . $slider->image) }}" alt="{{ $slider->title }}" class="w-full h-full object-cover">
                    <div class="absolute inset-0 bg-black/40"></div>
                @else
                    <div class="absolute inset-0 bg-gradient-to-r from-green-700 to-green-500"></div>
                @endif
                <div class="absolute inset-0 flex items-center justify-center">
                    <div class="text-center text-white px-4">
                        <h2 class="text-2xl sm:text-3xl md:text-4xl font-bold mb-2">{{ $slider->title }}</h2>
                        @if($slider->subtitle)
                            <p class="text-sm sm:text-base md:text-lg opacity-90 mb-4">{{ $slider->subtitle }}</p>
                        @endif
                        @if($slider->link)
                            <a href="{{ $slider->link }}" class="inline-block bg-white text-green-700 font-semibold px-6 py-2.5 rounded-lg hover:bg-green-50 transition text-sm">Lihat Selengkapnya</a>
                        @endif
                    </div>
                </div>
            </div>
            @endforeach
        </div>

        {{-- Controls --}}
        @if($sliders->count() > 1)
        <button @click="prev()" class="absolute left-3 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 text-white rounded-full p-2 transition">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg>
        </button>
        <button @click="next()" class="absolute right-3 top-1/2 -translate-y-1/2 bg-white/20 hover:bg-white/40 text-white rounded-full p-2 transition">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/></svg>
        </button>

        {{-- Dots --}}
        <div class="absolute bottom-4 left-1/2 -translate-x-1/2 flex space-x-2">
            @foreach($sliders as $index => $slider)
            <button @click="current = {{ $index }}" :class="current === {{ $index }} ? 'bg-white' : 'bg-white/50'" class="w-2.5 h-2.5 rounded-full transition"></button>
            @endforeach
        </div>
        @endif
    </section>
    @endif

    {{-- Latest Products --}}
    <section class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div class="flex items-center justify-between mb-8">
            <div>
                <h2 class="text-2xl font-bold text-gray-900">Produk Terbaru</h2>
                <p class="text-sm text-gray-500 mt-1">Temukan kebutuhan sembako Anda</p>
            </div>
            <a href="{{ route('products.index') }}" class="text-sm font-medium text-green-600 hover:text-green-700">Lihat Semua &rarr;</a>
        </div>

        <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4 sm:gap-6">
            @forelse($latestProducts as $product)
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
                <div class="col-span-full text-center py-12 text-gray-400">
                    <p>Belum ada produk tersedia.</p>
                </div>
            @endforelse
        </div>
    </section>
@endsection
