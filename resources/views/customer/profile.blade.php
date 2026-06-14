@extends('layouts.app')
@section('title', 'Akun Saya')

@section('content')
<div class="max-w-6xl mx-auto px-4 sm:px-6 py-10 sm:py-14">
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-8">
        <div>
            <p class="text-sm font-semibold uppercase tracking-widest text-green-600">Pelanggan</p>
            <h1 class="mt-1 text-3xl font-bold text-gray-900">Akun Saya</h1>
        </div>
        <form method="POST" action="{{ route('customer.logout') }}">
            @csrf
            <button type="submit" class="rounded-lg border border-gray-300 px-4 py-2 text-sm font-medium text-gray-700 hover:border-red-300 hover:text-red-600 transition">Keluar</button>
        </form>
    </div>

    <div class="grid lg:grid-cols-[280px_1fr] gap-7">
        <aside class="bg-white rounded-2xl border border-gray-100 shadow-sm p-6 h-fit">
            <div class="w-14 h-14 rounded-full bg-green-100 text-green-700 flex items-center justify-center text-xl font-bold">
                {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
            </div>
            <h2 class="mt-4 text-lg font-semibold text-gray-900">{{ auth()->user()->name }}</h2>
            <p class="mt-1 text-sm text-gray-500 break-all">{{ auth()->user()->email }}</p>
        </aside>

        <section>
            <h2 class="text-xl font-semibold text-gray-900 mb-4">Riwayat Pesanan</h2>
            <div class="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-5 py-3 text-left text-xs font-medium text-gray-500">No. Pesanan</th>
                                <th class="px-5 py-3 text-left text-xs font-medium text-gray-500">Tanggal</th>
                                <th class="px-5 py-3 text-left text-xs font-medium text-gray-500">Total</th>
                                <th class="px-5 py-3 text-left text-xs font-medium text-gray-500">Status</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-100">
                            @forelse($orders as $order)
                                <tr>
                                    <td class="px-5 py-4">
                                        <a href="{{ route('track.index', ['order_number' => $order->order_number]) }}" class="text-sm font-mono font-medium text-green-700 hover:underline">{{ $order->order_number }}</a>
                                    </td>
                                    <td class="px-5 py-4 text-sm text-gray-500">{{ $order->created_at->format('d/m/Y') }}</td>
                                    <td class="px-5 py-4 text-sm font-medium text-gray-900">{{ format_rupiah($order->total_price) }}</td>
                                    <td class="px-5 py-4">
                                        <span class="inline-flex rounded-full px-2 py-1 text-xs font-medium {{ $order->status_color }}">{{ $order->status_label }}</span>
                                    </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="4" class="px-5 py-10 text-center text-sm text-gray-500">Belum ada pesanan yang terhubung dengan email akun ini.</td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="mt-4">{{ $orders->links() }}</div>
        </section>
    </div>
</div>
@endsection
