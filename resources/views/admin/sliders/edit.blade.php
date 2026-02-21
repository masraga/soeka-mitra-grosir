@extends('layouts.admin')
@section('title', 'Edit Slider')

@section('content')
    <div class="max-w-lg">
        <a href="{{ route('admin.sliders.index') }}" class="text-sm text-gray-500 hover:text-gray-700 mb-4 inline-flex items-center gap-1">&larr; Kembali</a>

        <div class="bg-white rounded-xl border border-gray-100 p-6 mt-2">
            <form action="{{ route('admin.sliders.update', $slider) }}" method="POST" enctype="multipart/form-data" class="space-y-5">
                @csrf @method('PUT')
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Judul</label>
                    <input type="text" name="title" value="{{ old('title', $slider->title) }}" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @error('title') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Subtitle</label>
                    <input type="text" name="subtitle" value="{{ old('subtitle', $slider->subtitle) }}" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Gambar</label>
                    @if($slider->image)
                        <div class="mb-2">
                            <img src="{{ asset('storage/' . $slider->image) }}" class="w-full max-w-xs rounded-lg border">
                        </div>
                    @endif
                    <input type="file" name="image" accept="image/*" class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm file:mr-4 file:py-1 file:px-3 file:rounded-md file:border-0 file:bg-green-50 file:text-green-700 file:text-sm">
                    <p class="text-xs text-gray-400 mt-1">Kosongkan jika tidak ingin mengganti</p>
                    @error('image') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Link (opsional)</label>
                    <input type="url" name="link" value="{{ old('link', $slider->link) }}" placeholder="https://..." class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Urutan</label>
                        <input type="number" name="sort_order" value="{{ old('sort_order', $slider->sort_order) }}" min="0" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    </div>
                    <div class="flex items-end pb-1">
                        <div class="flex items-center gap-2">
                            <input type="hidden" name="is_active" value="0">
                            <input type="checkbox" name="is_active" value="1" id="is_active" {{ old('is_active', $slider->is_active) ? 'checked' : '' }} class="rounded border-gray-300 text-green-600 focus:ring-green-500">
                            <label for="is_active" class="text-sm text-gray-700">Aktif</label>
                        </div>
                    </div>
                </div>

                <div class="pt-2">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">Update Slider</button>
                </div>
            </form>
        </div>
    </div>
@endsection
