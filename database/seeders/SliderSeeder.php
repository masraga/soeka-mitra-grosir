<?php

namespace Database\Seeders;

use App\Models\Slider;
use Illuminate\Database\Seeder;

class SliderSeeder extends Seeder
{
    public function run(): void
    {
        $sliders = [
            [
                'title' => 'Selamat Datang di Soeka Mitra Grosir',
                'subtitle' => 'Belanja sembako lengkap dengan harga grosir terjangkau',
                'image' => '',
                'link' => '/products',
                'sort_order' => 1,
            ],
            [
                'title' => 'Promo Minggu Ini',
                'subtitle' => 'Dapatkan diskon spesial untuk beras dan minyak goreng',
                'image' => '',
                'link' => '/products',
                'sort_order' => 2,
            ],
            [
                'title' => 'Gratis Ongkir',
                'subtitle' => 'Gratis ongkos kirim untuk pembelian di atas Rp 200.000',
                'image' => '',
                'link' => '/products',
                'sort_order' => 3,
            ],
        ];

        foreach ($sliders as $slider) {
            Slider::updateOrCreate(['title' => $slider['title']], $slider);
        }
    }
}
