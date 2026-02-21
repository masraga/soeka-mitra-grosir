@extends('layouts.admin')
@section('title', 'Tambah Kategori')

@section('content')
    <div class="max-w-lg">
        <a href="{{ route('admin.categories.index') }}" class="text-sm text-gray-500 hover:text-gray-700 mb-4 inline-flex items-center gap-1">&larr; Kembali</a>

        <div class="bg-white rounded-xl border border-gray-100 p-6 mt-2">
            <form action="{{ route('admin.categories.store') }}" method="POST" enctype="multipart/form-data" class="space-y-5">
                @csrf
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nama Kategori <span class="text-red-500">*</span></label>
                    <input type="text" name="name" value="{{ old('name') }}" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @error('name') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Gambar Kategori</label>
                    <input type="file" name="image" accept="image/*" class="w-full border border-gray-200 rounded-lg px-4 py-2 text-sm file:mr-4 file:py-1 file:px-3 file:rounded-md file:border-0 file:bg-green-50 file:text-green-700 file:text-sm">
                    @error('image') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div class="pt-2">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">Simpan Kategori</button>
                </div>
            </form>
        </div>
    </div>
@endsection
