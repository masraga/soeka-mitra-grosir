<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ShippingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class CheckoutController extends Controller
{
    public function index()
    {
        $cart = session('cart', []);

        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Keranjang belanja kosong.');
        }

        $shippingServices = ShippingService::active()->get();
        $countries = config('locations.countries');
        $indonesiaProvinces = config('locations.indonesia_provinces');

        return view('checkout.index', compact(
            'cart',
            'shippingServices',
            'countries',
            'indonesiaProvinces'
        ));
    }

    public function store(Request $request)
    {
        $cart = session('cart', []);

        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Keranjang belanja kosong.');
        }

        $request->validate([
            'customer_first_name' => 'required|string|max:255',
            'customer_last_name' => 'required|string|max:255',
            'customer_email' => 'required|email:rfc|max:255',
            'customer_phone' => 'nullable|string|max:30',
            'customer_country_code' => [
                'required',
                'string',
                'size:2',
                Rule::in(array_keys(config('locations.countries'))),
            ],
            'customer_address_line_1' => 'required|string|max:500',
            'customer_address_line_2' => 'nullable|string|max:500',
            'customer_city' => 'required|string|max:255',
            'customer_province' => [
                'required',
                'string',
                'max:255',
                Rule::when(
                    $request->customer_country_code === 'ID',
                    Rule::in(config('locations.indonesia_provinces'))
                ),
            ],
            'customer_postal_code' => 'required|string|max:32',
            'shipping_service_id' => 'required|exists:shipping_services,id',
            'notes' => 'nullable|string|max:500',
        ]);

        $shippingService = ShippingService::findOrFail($request->shipping_service_id);

        // Verify stock availability
        foreach ($cart as $item) {
            $product = Product::find($item['product_id']);
            if (! $product || $product->stock < $item['quantity']) {
                return back()->with('error', 'Stok '.($product->name ?? 'produk').' tidak mencukupi.');
            }
        }

        $subtotal = 0;
        foreach ($cart as $item) {
            $subtotal += $item['price'] * $item['quantity'];
        }
        $totalPrice = $subtotal + $shippingService->cost;

        $deadlineHours = (int) setting('payment_deadline_hours', 1);

        try {
            DB::beginTransaction();

            $customerName = trim($request->customer_first_name.' '.$request->customer_last_name);
            $customerAddress = implode("\n", array_filter([
                $request->customer_address_line_1,
                $request->customer_address_line_2,
                implode(', ', [$request->customer_city, $request->customer_province]),
                $request->customer_postal_code,
                config('locations.countries.'.$request->customer_country_code),
            ]));

            $order = Order::create([
                'order_number' => Order::generateOrderNumber(),
                'customer_name' => $customerName,
                'customer_first_name' => $request->customer_first_name,
                'customer_last_name' => $request->customer_last_name,
                'customer_email' => strtolower($request->customer_email),
                'customer_phone' => $request->filled('customer_phone') ? $request->customer_phone : null,
                'customer_country_code' => $request->customer_country_code,
                'customer_address' => $customerAddress,
                'customer_address_line_1' => $request->customer_address_line_1,
                'customer_address_line_2' => $request->customer_address_line_2,
                'customer_city' => $request->customer_city,
                'customer_province' => $request->customer_province,
                'customer_postal_code' => $request->customer_postal_code,
                'notes' => $request->notes,
                'shipping_service_id' => $shippingService->id,
                'shipping_service_name' => $shippingService->name,
                'shipping_cost' => $shippingService->cost,
                'subtotal' => $subtotal,
                'total_price' => $totalPrice,
                'status' => 'pending_payment',
                'payment_deadline' => now()->addHours($deadlineHours),
            ]);

            foreach ($cart as $item) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item['product_id'],
                    'product_name' => $item['name'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price'],
                    'subtotal' => $item['price'] * $item['quantity'],
                ]);

                // Decrease stock
                Product::where('id', $item['product_id'])->decrement('stock', $item['quantity']);
            }

            DB::commit();

            // Clear cart
            session()->forget('cart');

            return redirect()->route('checkout.success', $order->order_number);
        } catch (\Exception $e) {
            DB::rollBack();

            return back()->with('error', 'Terjadi kesalahan saat memproses pesanan. Silakan coba lagi.');
        }
    }

    public function success(string $orderNumber)
    {
        $order = Order::where('order_number', $orderNumber)->with('items')->firstOrFail();

        return view('checkout.success', compact('order'));
    }
}
