<?php

namespace Tests\Feature;

use App\Models\Order;
use App\Models\ShippingService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class OrderTrackingTest extends TestCase
{
    use RefreshDatabase;

    public function test_order_can_be_tracked_and_payment_proof_uploaded_by_email(): void
    {
        Storage::fake('public');
        $order = $this->createOrder();

        $this->post(route('track.search'), [
            'order_number' => $order->order_number,
            'customer_identity' => 'CUSTOMER@example.com',
        ])->assertOk()
            ->assertSee($order->order_number)
            ->assertSee('Customer Example');

        $response = $this->post(route('track.upload', $order->order_number), [
            'customer_identity' => 'customer@example.com',
            'payment_proof' => UploadedFile::fake()->image('proof.jpg'),
        ]);

        $response->assertRedirect();
        $order->refresh();
        $this->assertNotNull($order->payment_proof);
        Storage::disk('public')->assertExists($order->payment_proof);
    }

    public function test_legacy_order_can_still_be_tracked_by_phone(): void
    {
        $order = $this->createOrder([
            'customer_first_name' => null,
            'customer_last_name' => null,
            'customer_email' => null,
            'customer_phone' => '08123456789',
        ]);

        $this->post(route('track.search'), [
            'order_number' => $order->order_number,
            'customer_identity' => '08123456789',
        ])->assertOk()
            ->assertSee('Legacy Customer');
    }

    private function createOrder(array $overrides = []): Order
    {
        $shipping = ShippingService::create([
            'name' => 'Kurir Toko',
            'cost' => 10000,
            'is_active' => true,
            'sort_order' => 1,
        ]);

        return Order::create(array_merge([
            'order_number' => 'ORD-20260612-00001',
            'customer_name' => 'Legacy Customer',
            'customer_first_name' => 'Customer',
            'customer_last_name' => 'Example',
            'customer_email' => 'customer@example.com',
            'customer_phone' => null,
            'customer_country_code' => 'ID',
            'customer_address' => "Jl. Contoh\nJakarta, DKI Jakarta\n10110\nIndonesia",
            'customer_address_line_1' => 'Jl. Contoh',
            'customer_city' => 'Jakarta',
            'customer_province' => 'DKI Jakarta',
            'customer_postal_code' => '10110',
            'shipping_service_id' => $shipping->id,
            'shipping_service_name' => $shipping->name,
            'shipping_cost' => $shipping->cost,
            'subtotal' => 75000,
            'total_price' => 85000,
            'status' => 'pending_payment',
            'payment_deadline' => now()->addHour(),
        ], $overrides));
    }
}
