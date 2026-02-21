@extends('layouts.admin')
@section('title', 'Pesanan')

@section('content')
    <div class="flex items-center justify-between mb-6">
        <form action="{{ route('admin.orders.index') }}" method="GET" class="flex gap-3">
            <input type="text" name="search" value="{{ request('search') }}" placeholder="Cari no. pesanan / nama..." class="border border-gray-200 rounded-lg px-4 py-2 text-sm focus:ring-2 focus:ring-green-500 outline-none">
            <select name="status" onchange="this.form.submit()" class="border border-gray-200 rounded-lg px-3 py-2 text-sm bg-white outline-none">
                <option value="">Semua Status</option>
                <option value="pending_payment" {{ request('status') == 'pending_payment' ? 'selected' : '' }}>Menunggu Pembayaran</option>
                <option value="payment_confirmed" {{ request('status') == 'payment_confirmed' ? 'selected' : '' }}>Pembayaran Dikonfirmasi</option>
                <option value="processing" {{ request('status') == 'processing' ? 'selected' : '' }}>Diproses</option>
                <option value="shipped" {{ request('status') == 'shipped' ? 'selected' : '' }}>Dikirim</option>
                <option value="completed" {{ request('status') == 'completed' ? 'selected' : '' }}>Selesai</option>
                <option value="cancelled" {{ request('status') == 'cancelled' ? 'selected' : '' }}>Dibatalkan</option>
            </select>
        </form>
    </div>

    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">No. Pesanan</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Pelanggan</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Total</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Status</th>
                        <th class="text-left text-xs font-medium text-gray-500 px-6 py-3">Tanggal</th>
                        <th class="text-right text-xs font-medium text-gray-500 px-6 py-3">Aksi</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    @forelse($orders as $order)
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-3 text-sm font-mono font-medium text-gray-900">{{ $order->order_number }}</td>
                        <td class="px-6 py-3">
                            <div class="text-sm font-medium text-gray-900">{{ $order->customer_name }}</div>
                            <div class="text-xs text-gray-500">{{ $order->customer_phone }}</div>
                        </td>
                        <td class="px-6 py-3 text-sm font-medium text-gray-900">{{ format_rupiah($order->total_price) }}</td>
                        <td class="px-6 py-3">
                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium {{ $order->status_color }}">
                                {{ $order->status_label }}
                            </span>
                        </td>
                        <td class="px-6 py-3 text-sm text-gray-500">{{ $order->created_at->format('d/m/Y H:i') }}</td>
                        <td class="px-6 py-3 text-right">
                            <a href="{{ route('admin.orders.show', $order) }}" class="text-sm text-blue-600 hover:text-blue-800">Detail</a>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="px-6 py-8 text-center text-sm text-gray-400">Belum ada pesanan</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    <div class="mt-4">{{ $orders->links() }}</div>
@endsection
