@extends('layouts.admin')
@section('title', 'Produk')

@section('content')
    <div class="flex items-center justify-between mb-6">
        <form action="{{ route('admin.products.index') }}" method="GET" class="flex gap-3">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari produk..." class="border border-gray-200 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-green-500 outline-none">
            <select name="category" onchange="this.form.submit()" class="border border-gray-200 rounded-lg px-3 py-2 text-sm bg-white outline-none">
                <option value="">Semua Kategori</option>
                @foreach($categories as $cat)
                    <option value="{{ $cat->id }}" {{ request('category') == $cat->id ? 'selected' : '' }}>{{ $cat->name }}</option>
                @endforeach
            </select>
        </form>
        <a href="{{ route('admin.products.create') }}" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">+ Tambah Produk</a>
    </div>

    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Produk</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Kategori</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Harga</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Stok</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Status</th>
                        <th class="text-right text-xs font-medium text-gray-500 px-6 py-3">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse($products as $product)
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-3">
                            <div class="flex items-center gap-3">
                                <div class="w-10 h-10 bg-gray-100 rounded-lg overflow-hidden shrink-0">
                                    @if($product->image)
                                        <img src="{{ asset('uploads/' . $product->image) }}" class="w-full h-full object-cover">
                                    @endif
                                </div>
                                <span class="text-sm font-medium text-gray-900">{{ $product->name }}</span>
                            </div>
                        </td>
                        <td class="px-6 py-3 text-sm text-gray-600">{{ $product->category->name ?? '-' }}</td>
                        <td class="px-6 py-3 text-sm font-medium text-gray-900">{{ format_rupiah($product->price) }}</td>
                        <td class="px-6 py-3 text-sm {{ $product->stock > 0 ? 'text-gray-900' : 'text-red-600 font-semibold' }}">{{ $product->stock }}</td>
                        <td class="px-6 py-3">
                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium {{ $product->is_active ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800' }}">
                                {{ $product->is_active ? 'Aktif' : 'Nonaktif' }}
                            </span>
                        </td>
                        <td class="px-6 py-3 text-right">
                            <div class="flex items-center justify-end gap-2">
                                <a href="{{ route('admin.products.edit', $product) }}" class="text-sm text-blue-600 hover:text-blue-800">Edit</a>
                                <form action="{{ route('admin.products.destroy', $product) }}" method="POST" onsubmit="return confirm('Hapus produk ini?')">
                                    @csrf @method('DELETE')
                                    <button class="text-sm text-red-600 hover:text-red-800">Hapus</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="px-6 py-8 text-center text-sm text-gray-400">Belum ada produk</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    <div class="mt-4">{{ $products->links() }}</div>
@endsection
