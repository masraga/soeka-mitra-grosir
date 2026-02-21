@extends('layouts.admin')
@section('title', 'Edit Layanan Pengiriman')

@section('content')
    <div class="max-w-lg">
        <a href="{{ route('admin.shipping.index') }}" class="text-sm text-gray-500 hover:text-gray-700 mb-4 inline-flex items-center gap-1">&larr; Kembali</a>

        <div class="bg-white rounded-xl border border-gray-100 p-6 mt-2">
            <form action="{{ route('admin.shipping.update', $shippingService) }}" method="POST" class="space-y-5">
                @csrf @method('PUT')
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nama Layanan <span class="text-red-500">*</span></label>
                    <input type="text" name="name" value="{{ old('name', $shippingService->name) }}" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @error('name') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Deskripsi</label>
                    <input type="text" name="description" value="{{ old('description', $shippingService->description) }}" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @error('description') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Biaya (Rp) <span class="text-red-500">*</span></label>
                        <input type="number" name="cost" value="{{ old('cost', $shippingService->cost) }}" min="0" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                        @error('cost') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Urutan</label>
                        <input type="number" name="sort_order" value="{{ old('sort_order', $shippingService->sort_order) }}" min="0" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Estimasi Pengiriman</label>
                    <input type="text" name="estimated_delivery" value="{{ old('estimated_delivery', $shippingService->estimated_delivery) }}" placeholder="cth: 1-2 jam" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @error('estimated_delivery') <p class="text-red-500 text-xs mt-1">{{ $message }}</p> @enderror
                </div>

                <div class="flex items-center gap-2">
                    <input type="hidden" name="is_active" value="0">
                    <input type="checkbox" name="is_active" value="1" id="is_active" {{ old('is_active', $shippingService->is_active) ? 'checked' : '' }} class="rounded border-gray-300 text-green-600 focus:ring-green-500">
                    <label for="is_active" class="text-sm text-gray-700">Aktif</label>
                </div>

                <div class="pt-2">
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">Update</button>
                </div>
            </form>
        </div>
    </div>
@endsection
