@extends('layouts.app')
@section('title', 'Pesanan Berhasil')

@section('content')
<div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <div class="text-center mb-8">
        <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/></svg>
        </div>
        <h1 class="text-2xl font-bold text-gray-900 mb-2">Pesanan Berhasil Dibuat!</h1>
        <p class="text-sm text-gray-500">Silakan lakukan pembayaran sebelum batas waktu berakhir</p>
    </div>

    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        {{-- Order Number --}}
        <div class="bg-green-50 px-6 py-4 text-center">
            <p class="text-sm text-gray-600">Nomor Pesanan</p>
            <p class="text-xl font-bold text-green-700 mt-1">{{ $order->order_number }}</p>
        </div>

        {{-- Countdown Timer --}}
        <div class="px-6 py-4 border-b text-center" x-data="{
            deadline: new Date('{{ $order->payment_deadline->toIso8601String() }}').getTime(),
            remaining: '',
            expired: false,
            init() {
                this.updateTimer();
                setInterval(() => this.updateTimer(), 1000);
            },
            updateTimer() {
                const now = new Date().getTime();
                const diff = this.deadline - now;
                if (diff <= 0) {
                    this.expired = true;
                    this.remaining = 'Waktu habis';
                    return;
                }
                const hours = Math.floor(diff / (1000 * 60 * 60));
                const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                const secs = Math.floor((diff % (1000 * 60)) / 1000);
                this.remaining = `${String(hours).padStart(2, '0')}:${String(mins).padStart(2, '0')}:${String(secs).padStart(2, '0')}`;
            }
        }">
            <p class="text-sm text-gray-600 mb-1">Batas Waktu Pembayaran</p>
            <p class="text-2xl font-bold" :class="expired ? 'text-red-600' : 'text-orange-600'" x-text="remaining"></p>
            <p class="text-xs text-gray-400 mt-1">{{ $order->payment_deadline->format('d M Y, H:i') }} WIB</p>
        </div>

        {{-- Bank Info --}}
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-3">Transfer ke Rekening</h3>
            <div class="bg-gray-50 rounded-lg p-4">
                <p class="text-sm text-gray-600">Bank <span class="font-semibold text-gray-900">{{ setting('bank_name', 'BCA') }}</span></p>
                <p class="text-lg font-bold text-gray-900 mt-1">{{ setting('bank_account_number', '-') }}</p>
                <p class="text-sm text-gray-600">a.n. <span class="font-semibold">{{ setting('bank_account_name', '-') }}</span></p>
            </div>
            <p class="text-sm font-semibold text-green-600 mt-3">Total Pembayaran: {{ format_rupiah($order->total_price) }}</p>
        </div>

        {{-- Order Items --}}
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-3">Detail Pesanan</h3>
            <div class="space-y-2">
                @foreach($order->items as $item)
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">{{ $item->product_name }} × {{ $item->quantity }}</span>
                    <span class="text-gray-900">{{ format_rupiah($item->subtotal) }}</span>
                </div>
                @endforeach
                <div class="flex justify-between text-sm pt-2 border-t">
                    <span class="text-gray-600">Subtotal</span>
                    <span class="text-gray-900">{{ format_rupiah($order->subtotal) }}</span>
                </div>
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">Ongkir ({{ $order->shipping_service_name }})</span>
                    <span class="text-gray-900">{{ $order->shipping_cost > 0 ? format_rupiah($order->shipping_cost) : 'Gratis' }}</span>
                </div>
                <div class="flex justify-between text-sm font-bold pt-2 border-t">
                    <span>Total</span>
                    <span class="text-green-600">{{ format_rupiah($order->total_price) }}</span>
                </div>
            </div>
        </div>

        {{-- Actions --}}
        <div class="px-6 py-4 bg-gray-50 text-center space-y-3">
            <p class="text-xs text-gray-500">Simpan nomor pesanan Anda untuk melacak status pesanan</p>
            <div class="flex flex-col sm:flex-row gap-3 justify-center">
                <a href="{{ route('track.index') }}" class="inline-block bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 px-6 rounded-lg transition text-sm">
                    Lacak Pesanan & Upload Bukti
                </a>
                <a href="{{ route('home') }}" class="inline-block border border-gray-200 text-gray-700 font-medium py-2.5 px-6 rounded-lg hover:bg-gray-50 transition text-sm">
                    Kembali ke Beranda
                </a>
            </div>
        </div>
    </div>
</div>
@endsection
