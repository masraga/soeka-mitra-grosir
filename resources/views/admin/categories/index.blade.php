@extends('layouts.admin')
@section('title', 'Kategori')

@section('content')
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-lg font-semibold text-gray-800">Daftar Kategori</h2>
        <a href="{{ route('admin.categories.create') }}" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">+ Tambah Kategori</a>
    </div>

    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        <table class="w-full">
            <thead class="bg-gray-50">
                <tr>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Kategori</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Slug</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Jumlah Produk</th>
                    <th class="text-right text-xs font-medium text-gray-500 px-6 py-3">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                @forelse($categories as $category)
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-3">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 bg-gray-100 rounded-lg overflow-hidden shrink-0">
                                @if($category->image)
                                    <img src="{{ asset('uploads/' . $category->image) }}" class="w-full h-full object-cover">
                                @endif
                            </div>
                            <span class="text-sm font-medium text-gray-900">{{ $category->name }}</span>
                        </div>
                    </td>
                    <td class="px-6 py-3 text-sm text-gray-500">{{ $category->slug }}</td>
                    <td class="px-6 py-3 text-sm text-gray-600">{{ $category->products_count }} produk</td>
                    <td class="px-6 py-3 text-right">
                        <div class="flex items-center justify-end gap-2">
                            <a href="{{ route('admin.categories.edit', $category) }}" class="text-sm text-blue-600 hover:text-blue-800">Edit</a>
                            <form action="{{ route('admin.categories.destroy', $category) }}" method="POST" onsubmit="return confirm('Hapus kategori ini?')">
                                @csrf @method('DELETE')
                                <button class="text-sm text-red-600 hover:text-red-800">Hapus</button>
                            </form>
                        </div>
                    </td>
                </tr>
                @empty
                <tr><td colspan="4" class="px-6 py-8 text-center text-sm text-gray-400">Belum ada kategori</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection
