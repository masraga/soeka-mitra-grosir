<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run(): void
    {
        $categories = [
            ['name' => 'Beras & Gandum', 'slug' => 'beras-gandum'],
            ['name' => 'Minyak Goreng', 'slug' => 'minyak-goreng'],
            ['name' => 'Gula & Garam', 'slug' => 'gula-garam'],
            ['name' => 'Tepung', 'slug' => 'tepung'],
            ['name' => 'Mie & Pasta', 'slug' => 'mie-pasta'],
            ['name' => 'Susu & Olahan', 'slug' => 'susu-olahan'],
            ['name' => 'Kopi & Teh', 'slug' => 'kopi-teh'],
            ['name' => 'Bumbu Dapur', 'slug' => 'bumbu-dapur'],
            ['name' => 'Makanan Kaleng', 'slug' => 'makanan-kaleng'],
            ['name' => 'Sabun & Deterjen', 'slug' => 'sabun-deterjen'],
        ];

        foreach ($categories as $category) {
            Category::updateOrCreate(['slug' => $category['slug']], $category);
        }
    }
}
