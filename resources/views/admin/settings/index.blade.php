@extends('layouts.admin')
@section('title', 'Pengaturan')

@section('content')
    <form action="{{ route('admin.settings.update') }}" method="POST" class="space-y-6">
        @csrf @method('PUT')

        @foreach($settings as $group => $items)
        <div class="bg-white rounded-xl border border-gray-100 p-6">
            <h3 class="text-sm font-semibold text-gray-800 mb-4 uppercase tracking-wider">
                @switch($group)
                    @case('payment') Pengaturan Pembayaran @break
                    @case('store') Informasi Toko @break
                    @default {{ ucfirst($group) }}
                @endswitch
            </h3>

            <div class="space-y-4">
                @foreach($items as $setting)
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">{{ $setting->label }}</label>
                    @if($setting->type === 'textarea')
                        <textarea name="settings[{{ $setting->key }}]" rows="3" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">{{ old('settings.' . $setting->key, $setting->value) }}</textarea>
                    @elseif($setting->type === 'number')
                        <input type="number" name="settings[{{ $setting->key }}]" value="{{ old('settings.' . $setting->key, $setting->value) }}" min="0" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @else
                        <input type="text" name="settings[{{ $setting->key }}]" value="{{ old('settings.' . $setting->key, $setting->value) }}" class="w-full border border-gray-200 rounded-lg px-4 py-2.5 text-sm focus:ring-2 focus:ring-green-500 outline-none">
                    @endif
                </div>
                @endforeach
            </div>
        </div>
        @endforeach

        <div>
            <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-2.5 rounded-lg text-sm font-medium transition">Simpan Pengaturan</button>
        </div>
    </form>
@endsection
