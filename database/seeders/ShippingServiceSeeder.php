<?php

namespace Database\Seeders;

use App\Models\ShippingService;
use Illuminate\Database\Seeder;

class ShippingServiceSeeder extends Seeder
{
    public function run(): void
    {
        $services = [
            ['name' => 'Ambil di Toko', 'description' => 'Ambil pesanan langsung di toko kami', 'cost' => 0, 'estimated_delivery' => 'Langsung', 'sort_order' => 1],
            ['name' => 'Kurir Toko', 'description' => 'Diantar oleh kurir toko ke alamat Anda', 'cost' => 10000, 'estimated_delivery' => '1-2 hari', 'sort_order' => 2],
            ['name' => 'Gosend / Grab Instant', 'description' => 'Pengiriman cepat via ojek online', 'cost' => 15000, 'estimated_delivery' => 'Hari ini', 'sort_order' => 3],
            ['name' => 'Gosend / Grab Same Day', 'description' => 'Pengiriman dalam hari yang sama', 'cost' => 20000, 'estimated_delivery' => 'Hari ini', 'sort_order' => 4],
        ];

        foreach ($services as $service) {
            ShippingService::updateOrCreate(['name' => $service['name']], $service);
        }
    }
}
