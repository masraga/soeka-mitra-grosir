<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create admin user
        User::updateOrCreate(
            ['email' => 'admin@soekamitra.com'],
            [
                'name' => 'Administrator',
                'password' => bcrypt('password'),
                'role' => 'admin',
            ]
        );

        $this->call([
            SettingSeeder::class,
            CategorySeeder::class,
            ProductSeeder::class,
            ShippingServiceSeeder::class,
            SliderSeeder::class,
        ]);
    }
}
