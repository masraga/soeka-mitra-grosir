<?php

namespace Tests\Feature;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;
use App\Models\ShippingService;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class CheckoutTest extends TestCase
{
    use RefreshDatabase;

    public function test_customer_can_checkout_with_structured_address_and_without_phone(): void
    {
        [$product, $shipping] = $this->createCheckoutData();

        $response = $this->withSession([
            'cart' => [
                (string) $product->id => [
                    'product_id' => $product->id,
                    'name' => $product->name,
                    'price' => $product->price,
                    'image' => null,
                    'quantity' => 2,
                    'stock' => $product->stock,
                ],
            ],
        ])->post(route('checkout.store'), [
            'customer_first_name' => 'Raga',
            'customer_last_name' => 'Kusuma',
            'customer_email' => 'RAGA@example.com',
            'customer_phone' => '',
            'customer_country_code' => 'ID',
            'customer_address_line_1' => 'Jl. Bukit Pasir No. 10',
            'customer_address_line_2' => 'Unit 2',
            'customer_city' => 'Pekanbaru',
            'customer_province' => 'Riau',
            'customer_postal_code' => '28289',
            'notes' => 'Hubungi saat tiba.',
            'shipping_service_id' => $shipping->id,
        ]);

        $order = Order::firstOrFail();

        $response->assertRedirect(route('checkout.success', $order->order_number));
        $this->assertSame('Raga Kusuma', $order->customer_name);
        $this->assertSame('raga@example.com', $order->customer_email);
        $this->assertNull($order->customer_phone);
        $this->assertSame('Riau', $order->customer_province);
        $this->assertStringContainsString('Pekanbaru, Riau', $order->customer_address);
        $this->assertSame(8, $product->fresh()->stock);
        $this->assertEmpty(session('cart', []));
    }

    public function test_checkout_validates_country_email_and_indonesian_province(): void
    {
        [$product, $shipping] = $this->createCheckoutData();

        $response = $this->from(route('checkout.index'))
            ->withSession([
                'cart' => [
                    (string) $product->id => [
                        'product_id' => $product->id,
                        'name' => $product->name,
                        'price' => $product->price,
                        'image' => null,
                        'quantity' => 1,
                        'stock' => $product->stock,
                    ],
                ],
            ])->post(route('checkout.store'), [
                'customer_first_name' => 'Raga',
                'customer_last_name' => '',
                'customer_email' => 'bukan-email',
                'customer_country_code' => 'ID',
                'customer_address_line_1' => 'Jl. Contoh',
                'customer_city' => 'Pekanbaru',
                'customer_province' => 'Provinsi Tidak Valid',
                'customer_postal_code' => '28289',
                'shipping_service_id' => $shipping->id,
            ]);

        $response->assertRedirect(route('checkout.index'));
        $response->assertSessionHasErrors([
            'customer_last_name',
            'customer_email',
            'customer_province',
        ]);
        $this->assertDatabaseCount('orders', 0);
    }

    public function test_non_indonesian_checkout_accepts_free_text_state(): void
    {
        [$product, $shipping] = $this->createCheckoutData();

        $this->withSession([
            'cart' => [
                (string) $product->id => [
                    'product_id' => $product->id,
                    'name' => $product->name,
                    'price' => $product->price,
                    'image' => null,
                    'quantity' => 1,
                    'stock' => $product->stock,
                ],
            ],
        ])->post(route('checkout.store'), [
            'customer_first_name' => 'Jane',
            'customer_last_name' => 'Doe',
            'customer_email' => 'jane@example.com',
            'customer_country_code' => 'US',
            'customer_address_line_1' => '123 Main Street',
            'customer_city' => 'Austin',
            'customer_province' => 'Texas',
            'customer_postal_code' => '78701',
            'shipping_service_id' => $shipping->id,
        ])->assertRedirect();

        $this->assertDatabaseHas('orders', [
            'customer_country_code' => 'US',
            'customer_province' => 'Texas',
            'customer_postal_code' => '78701',
        ]);
    }

    private function createCheckoutData(): array
    {
        $category = Category::create([
            'name' => 'Beras',
            'slug' => 'beras',
        ]);

        $product = Product::create([
            'category_id' => $category->id,
            'name' => 'Beras Premium',
            'slug' => 'beras-premium',
            'price' => 75000,
            'stock' => 10,
            'is_active' => true,
        ]);

        $shipping = ShippingService::create([
            'name' => 'Kurir Toko',
            'cost' => 10000,
            'is_active' => true,
            'sort_order' => 1,
        ]);

        return [$product, $shipping];
    }
}
