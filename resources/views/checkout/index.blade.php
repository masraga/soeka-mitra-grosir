@extends('layouts.app')
@section('title', 'Checkout')

@section('content')
<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8" x-data="{
    shippingCost: 0,
    subtotal: {{ cart_total() }},
    setShipping(cost) {
        this.shippingCost = parseInt(cost);
    },
    get total() {
        return this.subtotal + this.shippingCost;
    },
    formatRupiah(num) {
        return 'Rp ' + num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
    }
}">
    <h1 class="text-2xl font-bold text-gray-900 mb-6">Checkout</h1>

    <form action="{{ route('checkout.store') }}" method="POST">
        @csrf
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
            {{-- Customer Info --}}
            <div class="lg:col-span-2 space-y-6">
                <div class="bg-white rounded-xl border border-gray-100 p-6">
                    <h2 class="text-lg font-semibold text-gray-900 mb-4">Data Pemesan</h2>
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Nama Lengkap *</label>
                            <input type="text" name="customer_name" value="{{ old('customer_name') }}" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_name') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Nomor Telepon *</label>
                            <input type="text" name="customer_phone" value="{{ old('customer_phone') }}" required placeholder="08xxxxxxxxxx" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_phone') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Alamat Pengiriman *</label>
                            <textarea name="customer_address" rows="3" required class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">{{ old('customer_address') }}</textarea>
                            @error('customer_address') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Catatan (opsional)</label>
                            <textarea name="notes" rows="2" placeholder="Catatan untuk pesanan Anda..." class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">{{ old('notes') }}</textarea>
                        </div>
                    </div>
                </div>

                {{-- Shipping --}}
                <div class="bg-white rounded-xl border border-gray-100 p-6">
                    <h2 class="text-lg font-semibold text-gray-900 mb-4">Jasa Pengiriman</h2>
                    @error('shipping_service_id') <p class="text-xs text-red-500 mb-3">{{ $message }}</p> @enderror
                    <div class="space-y-3">
                        @foreach($shippingServices as $service)
                        <label class="flex items-center justify-between p-3 border border-gray-200 rounded-lg cursor-pointer hover:border-green-300 transition has-[:checked]:border-green-500 has-[:checked]:bg-green-50">
                            <div class="flex items-center">
                                <input type="radio" name="shipping_service_id" value="{{ $service->id }}" @change="setShipping({{ $service->cost }})" {{ old('shipping_service_id') == $service->id ? 'checked' : '' }} class="mr-3 text-green-600 focus:ring-green-500" required>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">{{ $service->name }}</p>
                                    @if($service->estimated_delivery)
                                        <p class="text-xs text-gray-500">Est. {{ $service->estimated_delivery }}</p>
                                    @endif
                                </div>
                            </div>
                            <span class="text-sm font-semibold {{ $service->cost > 0 ? 'text-gray-900' : 'text-green-600' }}">
                                {{ $service->cost > 0 ? format_rupiah($service->cost) : 'Gratis' }}
                            </span>
                        </label>
                        @endforeach
                    </div>
                </div>
            </div>

            {{-- Order Summary --}}
            <div>
                <div class="bg-white rounded-xl border border-gray-100 p-6 sticky top-24">
                    <h2 class="text-lg font-semibold text-gray-900 mb-4">Ringkasan Pesanan</h2>

                    <div class="space-y-3 mb-4 max-h-64 overflow-y-auto">
                        @foreach($cart as $item)
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600">{{ $item['name'] }} × {{ $item['quantity'] }}</span>
                            <span class="font-medium text-gray-900">{{ format_rupiah($item['price'] * $item['quantity']) }}</span>
                        </div>
                        @endforeach
                    </div>

                    <div class="border-t pt-3 space-y-2">
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600">Subtotal</span>
                            <span class="font-medium text-gray-900">{{ format_rupiah(cart_total()) }}</span>
                        </div>
                        <div class="flex justify-between text-sm">
                            <span class="text-gray-600">Ongkos Kirim</span>
                            <span class="font-medium text-gray-900" x-text="shippingCost > 0 ? formatRupiah(shippingCost) : 'Pilih jasa kirim'"></span>
                        </div>
                        <div class="flex justify-between text-base font-bold border-t pt-2 mt-2">
                            <span class="text-gray-900">Total</span>
                            <span class="text-green-600" x-text="formatRupiah(total)"></span>
                        </div>
                    </div>

                    <button type="submit" class="w-full mt-4 bg-green-600 hover:bg-green-700 text-white font-medium py-3 rounded-lg transition">
                        Buat Pesanan
                    </button>

                    <p class="text-xs text-gray-400 text-center mt-3">
                        Batas waktu pembayaran: {{ setting('payment_deadline_hours', 1) }} jam
                    </p>
                </div>
            </div>
        </div>
    </form>
</div>
@endsection
