<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        DB::table('settings')->updateOrInsert(
            ['key' => 'store_email'],
            [
                'value' => 'soekamitragrosir@gmail.com',
                'type' => 'string',
                'group' => 'store',
                'label' => 'Email Toko',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        );
    }

    public function down(): void
    {
        DB::table('settings')->where('key', 'store_email')->delete();
    }
};
