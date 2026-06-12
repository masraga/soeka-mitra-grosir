@extends('layouts.app')
@section('title', 'Checkout')

@section('content')
<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8" x-data="{
    country: @js(old('customer_country_code', 'ID')),
    province: @js(old('customer_province', '')),
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
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Nama depan <span class="text-red-500">*</span></label>
                                <input type="text" name="customer_first_name" value="{{ old('customer_first_name') }}" required autocomplete="given-name" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                                @error('customer_first_name') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-1">Nama belakang <span class="text-red-500">*</span></label>
                                <input type="text" name="customer_last_name" value="{{ old('customer_last_name') }}" required autocomplete="family-name" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                                @error('customer_last_name') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                            </div>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Negara/Wilayah <span class="text-red-500">*</span></label>
                            <select name="customer_country_code" x-model="country" @change="province = ''" required autocomplete="country" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm bg-white focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                                @foreach($countries as $code => $countryName)
                                    <option value="{{ $code }}" {{ old('customer_country_code', 'ID') === $code ? 'selected' : '' }}>{{ $countryName }}</option>
                                @endforeach
                            </select>
                            @error('customer_country_code') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Alamat jalan <span class="text-red-500">*</span></label>
                            <input type="text" name="customer_address_line_1" value="{{ old('customer_address_line_1') }}" required autocomplete="address-line1" placeholder="Nomor rumah dan nama jalan" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_address_line_1') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label for="customer_address_line_2" class="sr-only">Detail alamat tambahan</label>
                            <input id="customer_address_line_2" type="text" name="customer_address_line_2" value="{{ old('customer_address_line_2') }}" autocomplete="address-line2" placeholder="Apartemen, suit, unit, dll. (opsional)" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_address_line_2') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Kota <span class="text-red-500">*</span></label>
                            <input type="text" name="customer_city" value="{{ old('customer_city') }}" required autocomplete="address-level2" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_city') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Provinsi <span class="text-red-500">*</span></label>
                            <input type="hidden" name="customer_province" :value="province">
                            <select x-show="country === 'ID'" x-model="province" :disabled="country !== 'ID'" :required="country === 'ID'" autocomplete="address-level1" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm bg-white focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                                <option value="">Pilih opsi...</option>
                                @foreach($indonesiaProvinces as $province)
                                    <option value="{{ $province }}">{{ $province }}</option>
                                @endforeach
                            </select>
                            <input x-show="country !== 'ID'" x-model="province" :disabled="country === 'ID'" :required="country !== 'ID'" autocomplete="address-level1" placeholder="Provinsi / negara bagian" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_province') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Kode pos <span class="text-red-500">*</span></label>
                            <input type="text" name="customer_postal_code" value="{{ old('customer_postal_code') }}" required autocomplete="postal-code" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_postal_code') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Telepon (opsional)</label>
                            <input type="tel" name="customer_phone" value="{{ old('customer_phone') }}" autocomplete="tel" placeholder="08xxxxxxxxxx" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_phone') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">Alamat email <span class="text-red-500">*</span></label>
                            <input type="email" name="customer_email" value="{{ old('customer_email') }}" required autocomplete="email" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">
                            @error('customer_email') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
                        </div>

                        <div class="border-t border-gray-100 pt-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Catatan Pesanan (opsional)</label>
                            <textarea name="notes" rows="3" placeholder="Catatan tentang pesanan Anda, misal: catatan khusus untuk pengiriman." class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 focus:border-green-500 outline-none">{{ old('notes') }}</textarea>
                            @error('notes') <p class="text-xs text-red-500 mt-1">{{ $message }}</p> @enderror
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
