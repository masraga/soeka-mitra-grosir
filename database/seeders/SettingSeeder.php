<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    public function run(): void
    {
        $settings = [
            // Payment
            ['key' => 'payment_deadline_hours', 'value' => '1', 'type' => 'integer', 'group' => 'payment', 'label' => 'Batas Waktu Pembayaran (Jam)'],
            ['key' => 'bank_name', 'value' => 'BCA', 'type' => 'string', 'group' => 'payment', 'label' => 'Nama Bank'],
            ['key' => 'bank_account_number', 'value' => '1234567890', 'type' => 'string', 'group' => 'payment', 'label' => 'Nomor Rekening'],
            ['key' => 'bank_account_name', 'value' => 'Soeka Mitra Grosir', 'type' => 'string', 'group' => 'payment', 'label' => 'Atas Nama Rekening'],

            // Store
            ['key' => 'store_name', 'value' => 'Soeka Mitra Grosir', 'type' => 'string', 'group' => 'store', 'label' => 'Nama Toko'],
            ['key' => 'store_address', 'value' => 'Jl. Contoh No. 123, Jakarta', 'type' => 'string', 'group' => 'store', 'label' => 'Alamat Toko'],
            ['key' => 'store_phone', 'value' => '08123456789', 'type' => 'string', 'group' => 'store', 'label' => 'Nomor Telepon Toko'],
            ['key' => 'store_description', 'value' => 'Toko grosir sembako terpercaya dengan harga terjangkau', 'type' => 'string', 'group' => 'store', 'label' => 'Deskripsi Toko'],
        ];

        foreach ($settings as $setting) {
            Setting::updateOrCreate(['key' => $setting['key']], $setting);
        }
    }
}
