@extends('layouts.app')
@section('title', 'Lacak Pesanan')

@section('content')
<div class="max-w-2xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
    <h1 class="text-2xl font-bold text-gray-900 mb-6">Lacak Pesanan</h1>

    {{-- Search Form --}}
    <div class="bg-white rounded-xl border border-gray-100 p-6 mb-6">
        <form action="{{ route('track.search') }}" method="POST">
            @csrf
            <div class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nomor Pesanan</label>
                    <input type="text" name="order_number" value="{{ old('order_number', request('order_number')) }}" placeholder="ORD-XXXXXXXX-XXXXX" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Nomor Telepon</label>
                    <input type="text" name="customer_phone" value="{{ old('customer_phone') }}" placeholder="08xxxxxxxxxx" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                </div>
                <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 rounded-lg transition text-sm">
                    Lacak Pesanan
                </button>
            </div>
        </form>
    </div>

    {{-- Order Detail --}}
    @isset($order)
    <div class="bg-white rounded-xl border border-gray-100 overflow-hidden">
        {{-- Status --}}
        <div class="px-6 py-4 border-b">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Nomor Pesanan</p>
                    <p class="font-bold text-gray-900">{{ $order->order_number }}</p>
                </div>
                <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold
                    {{ match($order->status) {
                        'pending_payment' => 'bg-yellow-100 text-yellow-800',
                        'payment_confirmed' => 'bg-blue-100 text-blue-800',
                        'processing' => 'bg-indigo-100 text-indigo-800',
                        'shipped' => 'bg-purple-100 text-purple-800',
                        'completed' => 'bg-green-100 text-green-800',
                        'cancelled' => 'bg-red-100 text-red-800',
                        default => 'bg-gray-100 text-gray-800',
                    } }}">
                    {{ $order->status_label }}
                </span>
            </div>
        </div>

        {{-- Countdown (if pending) --}}
        @if($order->status === 'pending_payment' && !$order->is_expired)
        <div class="px-6 py-3 bg-yellow-50 border-b" x-data="{
            deadline: new Date('{{ $order->payment_deadline->toIso8601String() }}').getTime(),
            remaining: '', expired: false,
            init() { this.updateTimer(); setInterval(() => this.updateTimer(), 1000); },
            updateTimer() {
                const diff = this.deadline - Date.now();
                if (diff <= 0) { this.expired = true; this.remaining = 'Waktu habis'; return; }
                const h = Math.floor(diff / 3600000);
                const m = Math.floor((diff % 3600000) / 60000);
                const s = Math.floor((diff % 60000) / 1000);
                this.remaining = `${String(h).padStart(2,'0')}:${String(m).padStart(2,'0')}:${String(s).padStart(2,'0')}`;
            }
        }">
            <div class="flex items-center justify-between">
                <span class="text-sm text-yellow-700">Sisa waktu pembayaran:</span>
                <span class="font-bold text-lg" :class="expired ? 'text-red-600' : 'text-yellow-700'" x-text="remaining"></span>
            </div>
        </div>
        @endif

        {{-- Customer Info --}}
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-2">Info Pemesan</h3>
            <div class="text-sm text-gray-600 space-y-1">
                <p>{{ $order->customer_name }}</p>
                <p>{{ $order->customer_phone }}</p>
                <p>{{ $order->customer_address }}</p>
                @if($order->notes) <p class="italic">"{{ $order->notes }}"</p> @endif
            </div>
        </div>

        {{-- Items --}}
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-2">Detail Pesanan</h3>
            <div class="space-y-2">
                @foreach($order->items as $item)
                <div class="flex justify-between text-sm">
                    <span class="text-gray-600">{{ $item->product_name }} × {{ $item->quantity }}</span>
                    <span>{{ format_rupiah($item->subtotal) }}</span>
                </div>
                @endforeach
                <div class="border-t pt-2 mt-2 space-y-1">
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-600">Subtotal</span>
                        <span>{{ format_rupiah($order->subtotal) }}</span>
                    </div>
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-600">Ongkir ({{ $order->shipping_service_name }})</span>
                        <span>{{ $order->shipping_cost > 0 ? format_rupiah($order->shipping_cost) : 'Gratis' }}</span>
                    </div>
                    <div class="flex justify-between text-sm font-bold border-t pt-2">
                        <span>Total</span>
                        <span class="text-green-600">{{ format_rupiah($order->total_price) }}</span>
                    </div>
                </div>
            </div>
        </div>

        {{-- Payment Proof Section --}}
        @if($order->status === 'pending_payment' && !$order->is_expired)
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-3">Upload Bukti Pembayaran</h3>

            {{-- Bank Info --}}
            <div class="bg-gray-50 rounded-lg p-3 mb-4 text-sm">
                <p>Transfer ke <span class="font-semibold">{{ setting('bank_name') }}</span> - <span class="font-bold">{{ setting('bank_account_number') }}</span></p>
                <p>a.n. {{ setting('bank_account_name') }}</p>
                <p class="font-semibold text-green-600 mt-1">Total: {{ format_rupiah($order->total_price) }}</p>
            </div>

            @if($order->payment_proof)
                <div class="mb-3">
                    <p class="text-sm text-green-600 font-medium">✓ Bukti pembayaran sudah diupload</p>
                    <img src="{{ asset('storage/' . $order->payment_proof) }}" alt="Bukti Pembayaran" class="mt-2 rounded-lg max-w-xs border">
                </div>
            @else
                <form action="{{ route('track.upload', $order->order_number) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="customer_phone" value="{{ $order->customer_phone }}">
                    <div class="space-y-3">
                        <input type="file" name="payment_proof" accept="image/*" required class="w-full text-sm border border-gray-200 rounded-lg file:mr-4 file:py-2 file:px-4 file:border-0 file:text-sm file:bg-green-50 file:text-green-700 hover:file:bg-green-100">
                        @error('payment_proof') <p class="text-xs text-red-500">{{ $message }}</p> @enderror
                        <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-medium py-2.5 rounded-lg transition text-sm">
                            Upload Bukti
                        </button>
                    </div>
                </form>
            @endif
        </div>
        @elseif($order->payment_proof)
        <div class="px-6 py-4 border-b">
            <h3 class="text-sm font-semibold text-gray-900 mb-2">Bukti Pembayaran</h3>
            <img src="{{ asset('storage/' . $order->payment_proof) }}" alt="Bukti Pembayaran" class="rounded-lg max-w-xs border">
        </div>
        @endif

        {{-- Timestamps --}}
        <div class="px-6 py-3 bg-gray-50 text-xs text-gray-400">
            Pesanan dibuat: {{ $order->created_at->format('d M Y, H:i') }}
        </div>
    </div>
    @endisset
</div>
@endsection
