<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->string('customer_first_name')->nullable()->after('customer_name');
            $table->string('customer_last_name')->nullable()->after('customer_first_name');
            $table->string('customer_email')->nullable()->after('customer_last_name');
            $table->string('customer_phone')->nullable()->change();
            $table->string('customer_country_code', 2)->nullable()->after('customer_phone');
            $table->text('customer_address_line_1')->nullable()->after('customer_address');
            $table->text('customer_address_line_2')->nullable()->after('customer_address_line_1');
            $table->string('customer_city')->nullable()->after('customer_address_line_2');
            $table->string('customer_province')->nullable()->after('customer_city');
            $table->string('customer_postal_code', 32)->nullable()->after('customer_province');
        });

        DB::table('orders')->orderBy('id')->each(function ($order) {
            DB::table('orders')->where('id', $order->id)->update([
                'customer_first_name' => $order->customer_name,
                'customer_country_code' => 'ID',
                'customer_address_line_1' => $order->customer_address,
            ]);
        });
    }

    public function down(): void
    {
        DB::table('orders')->whereNull('customer_phone')->update(['customer_phone' => '']);

        Schema::table('orders', function (Blueprint $table) {
            $table->string('customer_phone')->nullable(false)->change();
            $table->dropColumn([
                'customer_first_name',
                'customer_last_name',
                'customer_email',
                'customer_country_code',
                'customer_address_line_1',
                'customer_address_line_2',
                'customer_city',
                'customer_province',
                'customer_postal_code',
            ]);
        });
    }
};
