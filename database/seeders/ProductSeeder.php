<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        $categories = Category::pluck('id', 'slug');

        $products = [
            // Beras & Gandum
            ['category' => 'beras-gandum', 'name' => 'Beras Premium 5kg', 'price' => 75000, 'stock' => 50, 'description' => 'Beras premium kualitas terbaik, pulen dan wangi. Cocok untuk konsumsi sehari-hari keluarga.'],
            ['category' => 'beras-gandum', 'name' => 'Beras Medium 5kg', 'price' => 60000, 'stock' => 80, 'description' => 'Beras medium dengan kualitas baik dan harga terjangkau untuk kebutuhan sehari-hari.'],
            ['category' => 'beras-gandum', 'name' => 'Beras Merah 1kg', 'price' => 25000, 'stock' => 30, 'description' => 'Beras merah organik kaya serat dan nutrisi, baik untuk kesehatan.'],

            // Minyak Goreng
            ['category' => 'minyak-goreng', 'name' => 'Minyak Goreng Bimoli 2L', 'price' => 35000, 'stock' => 60, 'description' => 'Minyak goreng berkualitas dari kelapa sawit pilihan, jernih dan tidak mudah berbusa.'],
            ['category' => 'minyak-goreng', 'name' => 'Minyak Goreng Tropical 1L', 'price' => 18000, 'stock' => 100, 'description' => 'Minyak goreng kemasan 1 liter, praktis untuk kebutuhan memasak sehari-hari.'],
            ['category' => 'minyak-goreng', 'name' => 'Minyak Goreng Curah 1L', 'price' => 14000, 'stock' => 120, 'description' => 'Minyak goreng curah ekonomis untuk kebutuhan rumah tangga.'],

            // Gula & Garam
            ['category' => 'gula-garam', 'name' => 'Gula Pasir 1kg', 'price' => 15000, 'stock' => 100, 'description' => 'Gula pasir putih bersih berkualitas tinggi untuk kebutuhan memasak dan minuman.'],
            ['category' => 'gula-garam', 'name' => 'Gula Merah 500g', 'price' => 12000, 'stock' => 40, 'description' => 'Gula merah asli dari tebu, cocok untuk bumbu masakan dan minuman tradisional.'],
            ['category' => 'gula-garam', 'name' => 'Garam Dapur Cap Kapal 250g', 'price' => 5000, 'stock' => 150, 'description' => 'Garam beryodium berkualitas untuk kebutuhan dapur sehari-hari.'],

            // Tepung
            ['category' => 'tepung', 'name' => 'Tepung Terigu Segitiga Biru 1kg', 'price' => 12000, 'stock' => 80, 'description' => 'Tepung terigu serbaguna cocok untuk membuat aneka kue dan gorengan.'],
            ['category' => 'tepung', 'name' => 'Tepung Beras Rose Brand 500g', 'price' => 8000, 'stock' => 60, 'description' => 'Tepung beras premium untuk membuat kue tradisional dan jajanan pasar.'],
            ['category' => 'tepung', 'name' => 'Tepung Tapioka 500g', 'price' => 7000, 'stock' => 70, 'description' => 'Tepung tapioka berkualitas untuk membuat bakso, cireng, dan aneka makanan.'],

            // Mie & Pasta
            ['category' => 'mie-pasta', 'name' => 'Indomie Goreng (5 pcs)', 'price' => 15000, 'stock' => 200, 'description' => 'Mie goreng instan favorit Indonesia, paket isi 5 bungkus.'],
            ['category' => 'mie-pasta', 'name' => 'Indomie Kuah Soto (5 pcs)', 'price' => 15000, 'stock' => 150, 'description' => 'Mie kuah rasa soto yang gurih dan lezat, paket isi 5 bungkus.'],
            ['category' => 'mie-pasta', 'name' => 'Sarimi Isi 2 (5 pcs)', 'price' => 13000, 'stock' => 100, 'description' => 'Mie instan isi 2 dengan rasa gurih, paket hemat 5 bungkus.'],

            // Susu & Olahan
            ['category' => 'susu-olahan', 'name' => 'Susu Kental Manis Frisian Flag 370g', 'price' => 12000, 'stock' => 90, 'description' => 'Susu kental manis berkualitas untuk minuman dan olesan roti.'],
            ['category' => 'susu-olahan', 'name' => 'Susu UHT Indomilk 1L', 'price' => 18000, 'stock' => 50, 'description' => 'Susu UHT full cream segar dan bergizi, kemasan 1 liter.'],
            ['category' => 'susu-olahan', 'name' => 'Susu Bubuk Dancow 400g', 'price' => 45000, 'stock' => 30, 'description' => 'Susu bubuk bergizi untuk seluruh keluarga, kemasan 400 gram.'],

            // Kopi & Teh
            ['category' => 'kopi-teh', 'name' => 'Kopi Kapal Api Special 165g', 'price' => 15000, 'stock' => 70, 'description' => 'Kopi bubuk asli pilihan dengan aroma dan rasa khas yang nikmat.'],
            ['category' => 'kopi-teh', 'name' => 'Teh Celup Sariwangi isi 25', 'price' => 8000, 'stock' => 100, 'description' => 'Teh celup berkualitas dengan cita rasa teh asli, isi 25 kantong.'],
            ['category' => 'kopi-teh', 'name' => 'Kopi ABC Susu isi 10 sachet', 'price' => 18000, 'stock' => 80, 'description' => 'Kopi instan 3in1 rasa susu yang creamy dan praktis, isi 10 sachet.'],

            // Bumbu Dapur
            ['category' => 'bumbu-dapur', 'name' => 'Kecap Manis ABC 600ml', 'price' => 22000, 'stock' => 60, 'description' => 'Kecap manis berkualitas tinggi untuk masakan Indonesia yang lezat.'],
            ['category' => 'bumbu-dapur', 'name' => 'Saos Sambal ABC 335ml', 'price' => 14000, 'stock' => 80, 'description' => 'Saos sambal pedas dengan cita rasa tomat asli yang nikmat.'],
            ['category' => 'bumbu-dapur', 'name' => 'Royco Kaldu Ayam 230g', 'price' => 13000, 'stock' => 90, 'description' => 'Penyedap rasa kaldu ayam untuk menambah cita rasa masakan.'],

            // Makanan Kaleng
            ['category' => 'makanan-kaleng', 'name' => 'Sarden ABC 425g', 'price' => 20000, 'stock' => 40, 'description' => 'Sarden dalam saus tomat yang lezat dan praktis untuk lauk keluarga.'],
            ['category' => 'makanan-kaleng', 'name' => 'Kornet Pronas 200g', 'price' => 28000, 'stock' => 35, 'description' => 'Kornet sapi berkualitas dalam kemasan kaleng, siap saji dan praktis.'],

            // Sabun & Deterjen
            ['category' => 'sabun-deterjen', 'name' => 'Deterjen Rinso Anti Noda 800g', 'price' => 20000, 'stock' => 50, 'description' => 'Deterjen bubuk dengan formula anti noda untuk cucian yang bersih dan wangi.'],
            ['category' => 'sabun-deterjen', 'name' => 'Sabun Cuci Piring Sunlight 800ml', 'price' => 16000, 'stock' => 70, 'description' => 'Sabun cuci piring yang efektif membersihkan lemak dan minyak membandel.'],
            ['category' => 'sabun-deterjen', 'name' => 'Sabun Mandi Lifebuoy 100g (4 pcs)', 'price' => 18000, 'stock' => 60, 'description' => 'Sabun mandi antibakteri untuk perlindungan keluarga, paket isi 4.'],
        ];

        foreach ($products as $product) {
            $categoryId = $categories[$product['category']] ?? null;
            if ($categoryId) {
                Product::updateOrCreate(
                    ['slug' => \Illuminate\Support\Str::slug($product['name'])],
                    [
                        'category_id' => $categoryId,
                        'name' => $product['name'],
                        'price' => $product['price'],
                        'stock' => $product['stock'],
                        'description' => $product['description'],
                        'is_active' => true,
                    ]
                );
            }
        }
    }
}
