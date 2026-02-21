@extends('layouts.admin')
@section('title', 'Detail Pesanan')

@section('content')
    <a href="{{ route('admin.orders.index') }}" class="text-sm text-gray-500 hover:text-gray-700 mb-4 inline-flex items-center gap-1">&larr; Kembali</a>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mt-2">
        {{-- Order Info --}}
        <div class="lg:col-span-2 space-y-6">
            {{-- Header --}}
            <div class="bg-white rounded-xl border border-gray-100 p-6">
                <div class="flex items-center justify-between mb-4">
                    <div>
                        <h2 class="text-lg font-semibold text-gray-900">{{ $order->order_number }}</h2>
                        <p class="text-sm text-gray-500">{{ $order->created_at->format('d F Y, H:i') }} WIB</p>
                    </div>
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium {{ $order->status_color }}">
                        {{ $order->status_label }}
                    </span>
                </div>

                {{-- Update Status --}}
                @if(!in_array($order->status, ['completed', 'cancelled']))
                <form action="{{ route('admin.orders.status', $order) }}" method="POST" class="flex items-center gap-3 p-4 bg-gray-50 rounded-lg">
                    @csrf @method('PATCH')
                    <label class="text-sm font-medium text-gray-700 shrink-0">Ubah Status:</label>
                    <select name="status" class="border border-gray-200 rounded-lg px-3 py-2 text-sm bg-white flex-1 outline-none">
                        <option value="pending_payment" {{ $order->status == 'pending_payment' ? 'selected' : '' }}>Menunggu Pembayaran</option>
                        <option value="payment_confirmed" {{ $order->status == 'payment_confirmed' ? 'selected' : '' }}>Pembayaran Dikonfirmasi</option>
                        <option value="processing" {{ $order->status == 'processing' ? 'selected' : '' }}>Diproses</option>
                        <option value="shipped" {{ $order->status == 'shipped' ? 'selected' : '' }}>Dikirim</option>
                        <option value="completed" {{ $order->status == 'completed' ? 'selected' : '' }}>Selesai</option>
                        <option value="cancelled" {{ $order->status == 'cancelled' ? 'selected' : '' }}>Dibatalkan</option>
                    </select>
                    <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition shrink-0">Update</button>
                </form>
                @endif
            </div>

            {{-- Items --}}
            <div class="bg-white rounded-xl border border-gray-100 p-6">
                <h3 class="text-sm font-semibold text-gray-800 mb-4">Item Pesanan</h3>
                <div class="space-y-3">
                    @foreach($order->items as $item)
                    <div class="flex items-center justify-between py-2 border-b border-gray-50 last:border-0">
                        <div class="flex items-center gap-3">
                            <div class="w-10 h-10 bg-gray-100 rounded-lg overflow-hidden shrink-0">
                                @if($item->product && $item->product->image)
                                    <img src="{{ asset('storage/' . $item->product->image) }}" class="w-full h-full object-cover">
                                @endif
                            </div>
                            <div>
                                <p class="text-sm font-medium text-gray-900">{{ $item->product_name }}</p>
                                <p class="text-xs text-gray-500">{{ $item->quantity }} x {{ format_rupiah($item->price) }}</p>
                            </div>
                        </div>
                        <span class="text-sm font-medium text-gray-900">{{ format_rupiah($item->subtotal) }}</span>
                    </div>
                    @endforeach
                </div>

                <div class="border-t border-gray-200 mt-4 pt-4 space-y-2">
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-500">Subtotal</span>
                        <span class="text-gray-900">{{ format_rupiah($order->subtotal) }}</span>
                    </div>
                    <div class="flex justify-between text-sm">
                        <span class="text-gray-500">Ongkir ({{ $order->shipping_service_name }})</span>
                        <span class="text-gray-900">{{ format_rupiah($order->shipping_cost) }}</span>
                    </div>
                    <div class="flex justify-between text-sm font-semibold border-t pt-2">
                        <span class="text-gray-900">Total</span>
                        <span class="text-green-600">{{ format_rupiah($order->total_price) }}</span>
                    </div>
                </div>
            </div>
        </div>

        {{-- Sidebar --}}
        <div class="space-y-6">
            {{-- Customer --}}
            <div class="bg-white rounded-xl border border-gray-100 p-6">
                <h3 class="text-sm font-semibold text-gray-800 mb-3">Data Pelanggan</h3>
                <div class="space-y-2 text-sm">
                    <div>
                        <span class="text-gray-500">Nama:</span>
                        <p class="font-medium text-gray-900">{{ $order->customer_name }}</p>
                    </div>
                    <div>
                        <span class="text-gray-500">Telepon:</span>
                        <p class="font-medium text-gray-900">{{ $order->customer_phone }}</p>
                    </div>
                    <div>
                        <span class="text-gray-500">Alamat:</span>
                        <p class="font-medium text-gray-900">{{ $order->customer_address }}</p>
                    </div>
                    @if($order->notes)
                    <div>
                        <span class="text-gray-500">Catatan:</span>
                        <p class="font-medium text-gray-900">{{ $order->notes }}</p>
                    </div>
                    @endif
                </div>
            </div>

            {{-- Payment Deadline --}}
            @if($order->status === 'pending_payment' && $order->payment_deadline)
            <div class="bg-yellow-50 rounded-xl border border-yellow-200 p-6">
                <h3 class="text-sm font-semibold text-yellow-800 mb-2">Batas Pembayaran</h3>
                <p class="text-sm text-yellow-700">{{ $order->payment_deadline->format('d/m/Y H:i') }} WIB</p>
                @if($order->is_expired)
                    <p class="text-xs text-red-600 font-semibold mt-1">Sudah melewati batas waktu!</p>
                @else
                    <p class="text-xs text-yellow-600 mt-1">Sisa waktu: {{ $order->time_remaining }}</p>
                @endif
            </div>
            @endif

            {{-- Payment Proof --}}
            <div class="bg-white rounded-xl border border-gray-100 p-6">
                <h3 class="text-sm font-semibold text-gray-800 mb-3">Bukti Pembayaran</h3>
                @if($order->payment_proof)
                    <a href="{{ asset('storage/' . $order->payment_proof) }}" target="_blank" class="block">
                        <img src="{{ asset('storage/' . $order->payment_proof) }}" class="w-full rounded-lg border hover:opacity-90 transition" alt="Bukti pembayaran">
                    </a>
                    <p class="text-xs text-gray-500 mt-2">Klik gambar untuk membuka ukuran penuh</p>
                @else
                    <p class="text-sm text-gray-400 italic">Belum ada bukti pembayaran</p>
                @endif
            </div>
        </div>
    </div>
@endsection
