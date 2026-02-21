@extends('layouts.admin')
@section('title', 'Dashboard')

@section('content')
    {{-- Stats Cards --}}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="bg-white rounded-xl border border-gray-100 p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Total Produk</p>
                    <p class="text-2xl font-bold text-gray-900 mt-1">{{ $totalProducts }}</p>
                </div>
                <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white rounded-xl border border-gray-100 p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Total Pesanan</p>
                    <p class="text-2xl font-bold text-gray-900 mt-1">{{ $totalOrders }}</p>
                </div>
                <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center">
                    <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white rounded-xl border border-gray-100 p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Menunggu Bayar</p>
                    <p class="text-2xl font-bold text-yellow-600 mt-1">{{ $pendingOrders }}</p>
                </div>
                <div class="w-10 h-10 bg-yellow-100 rounded-lg flex items-center justify-center">
                    <svg class="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
            </div>
        </div>
        <div class="bg-white rounded-xl border border-gray-100 p-5">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Pendapatan Hari Ini</p>
                    <p class="text-2xl font-bold text-green-600 mt-1">{{ format_rupiah($todayRevenue) }}</p>
                </div>
                <div class="w-10 h-10 bg-emerald-100 rounded-lg flex items-center justify-center">
                    <svg class="w-5 h-5 text-emerald-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/></svg>
                </div>
            </div>
        </div>
    </div>

    {{-- Recent Orders --}}
    <div class="bg-white rounded-xl border border-gray-100">
        <div class="px-6 py-4 border-b flex items-center justify-between">
            <h2 class="text-lg font-semibold text-gray-900">Pesanan Terbaru</h2>
            <a href="{{ route('admin.orders.index') }}" class="text-sm text-green-600 hover:text-green-700">Lihat Semua</a>
        </div>
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">No. Pesanan</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Customer</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Total</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Status</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Tanggal</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse($recentOrders as $order)
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-3">
                            <a href="{{ route('admin.orders.show', $order) }}" class="text-sm font-medium text-green-600 hover:text-green-700">{{ $order->order_number }}</a>
                        </td>
                        <td class="px-6 py-3 text-sm text-gray-600">{{ $order->customer_name }}</td>
                        <td class="px-6 py-3 text-sm font-medium text-gray-900">{{ format_rupiah($order->total_price) }}</td>
                        <td class="px-6 py-3">
                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium
                                {{ match($order->status) {
                                    'pending_payment' => 'bg-yellow-100 text-yellow-800',
                                    'payment_confirmed' => 'bg-blue-100 text-blue-800',
                                    'processing' => 'bg-indigo-100 text-indigo-800',
                                    'shipped' => 'bg-purple-100 text-purple-800',
                                    'completed' => 'bg-green-100 text-green-800',
                                    'cancelled' => 'bg-red-100 text-red-800',
                                    default => 'bg-gray-100 text-gray-800',
                                } }}">{{ $order->status_label }}</span>
                        </td>
                        <td class="px-6 py-3 text-sm text-gray-500">{{ $order->created_at->format('d/m/Y H:i') }}</td>
                    </tr>
                    @empty
                    <tr><td colspan="5" class="px-6 py-8 text-center text-sm text-gray-400">Belum ada pesanan</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
@endsection
