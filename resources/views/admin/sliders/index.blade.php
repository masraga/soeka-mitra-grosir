@extends('layouts.admin')
@section('title', 'Slider')

@section('content')
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-lg font-semibold text-gray-800">Slider Banner</h2>
        <a href="{{ route('admin.sliders.create') }}" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">+ Tambah Slider</a>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        @forelse($sliders as $slider)
        <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
            <div class="aspect-[16/6] bg-gray-100">
                @if($slider->image)
                    <img src="{{ asset('storage/' . $slider->image) }}" class="w-full h-full object-cover">
                @endif
            </div>
            <div class="p-4">
                <div class="flex items-center justify-between mb-2">
                    <h3 class="text-sm font-semibold text-gray-900">{{ $slider->title ?? 'Tanpa Judul' }}</h3>
                    <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium {{ $slider->is_active ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800' }}">
                        {{ $slider->is_active ? 'Aktif' : 'Nonaktif' }}
                    </span>
                </div>
                @if($slider->subtitle)
                    <p class="text-xs text-gray-500 mb-3">{{ $slider->subtitle }}</p>
                @endif
                <div class="flex items-center justify-between">
                    <span class="text-xs text-gray-400">Urutan: {{ $slider->sort_order }}</span>
                    <div class="flex items-center gap-2">
                        <a href="{{ route('admin.sliders.edit', $slider) }}" class="text-sm text-blue-600 hover:text-blue-800">Edit</a>
                        <form action="{{ route('admin.sliders.destroy', $slider) }}" method="POST" onsubmit="return confirm('Hapus slider ini?')">
                            @csrf @method('DELETE')
                            <button class="text-sm text-red-600 hover:text-red-800">Hapus</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @empty
        <div class="col-span-2 bg-white rounded-xl border border-gray-100 p-8 text-center text-sm text-gray-400">
            Belum ada slider
        </div>
        @endforelse
    </div>
@endsection
