@extends('layouts.admin')
@section('title', 'Layanan Pengiriman')

@section('content')
    <div class="flex items-center justify-between mb-6">
        <h2 class="text-lg font-semibold text-gray-800">Layanan Pengiriman</h2>
        <a href="{{ route('admin.shipping.create') }}" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition">+ Tambah Layanan</a>
    </div>

    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        <table class="w-full">
            <thead class="bg-gray-50">
                <tr>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Urutan</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Nama Layanan</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Biaya</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Estimasi</th>
                    <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Status</th>
                    <th class="text-right text-xs font-medium text-gray-500 px-6 py-3">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                @forelse($services as $service)
                <tr class="hover:bg-gray-50">
                    <td class="px-6 py-3 text-sm text-gray-500">{{ $service->sort_order }}</td>
                    <td class="px-6 py-3">
                        <div class="text-sm font-medium text-gray-900">{{ $service->name }}</div>
                        @if($service->description)
                            <div class="text-xs text-gray-500">{{ $service->description }}</div>
                        @endif
                    </td>
                    <td class="px-6 py-3 text-sm font-medium text-gray-900">{{ $service->cost > 0 ? format_rupiah($service->cost) : 'Gratis' }}</td>
                    <td class="px-6 py-3 text-sm text-gray-600">{{ $service->estimated_delivery ?? '-' }}</td>
                    <td class="px-6 py-3">
                        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium {{ $service->is_active ? 'bg-green-100 text-green-800' : 'bg-gray-100 text-gray-800' }}">
                            {{ $service->is_active ? 'Aktif' : 'Nonaktif' }}
                        </span>
                    </td>
                    <td class="px-6 py-3 text-right">
                        <div class="flex items-center justify-end gap-2">
                            <a href="{{ route('admin.shipping.edit', $service) }}" class="text-sm text-blue-600 hover:text-blue-800">Edit</a>
                            <form action="{{ route('admin.shipping.destroy', $service) }}" method="POST" onsubmit="return confirm('Hapus layanan ini?')">
                                @csrf @method('DELETE')
                                <button class="text-sm text-red-600 hover:text-red-800">Hapus</button>
                            </form>
                        </div>
                    </td>
                </tr>
                @empty
                <tr><td colspan="6" class="px-6 py-8 text-center text-sm text-gray-400">Belum ada layanan pengiriman</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
@endsection
