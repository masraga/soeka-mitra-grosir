<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ShippingService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    public function index()
    {
        $cart = session('cart', []);

        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Keranjang belanja kosong.');
        }

        $shippingServices = ShippingService::active()->get();

        return view('checkout.index', compact('cart', 'shippingServices'));
    }

    public function store(Request $request)
    {
        $cart = session('cart', []);

        if (empty($cart)) {
            return redirect()->route('cart.index')->with('error', 'Keranjang belanja kosong.');
        }

        $request->validate([
            'customer_name' => 'required|string|max:255',
            'customer_phone' => 'required|string|max:20',
            'customer_address' => 'required|string',
            'shipping_service_id' => 'required|exists:shipping_services,id',
            'notes' => 'nullable|string|max:500',
        ]);

        $shippingService = ShippingService::findOrFail($request->shipping_service_id);

        // Verify stock availability
        foreach ($cart as $item) {
            $product = Product::find($item['product_id']);
            if (!$product || $product->stock < $item['quantity']) {
                return back()->with('error', 'Stok ' . ($product->name ?? 'produk') . ' tidak mencukupi.');
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

            $order = Order::create([
                'order_number' => Order::generateOrderNumber(),
                'customer_name' => $request->customer_name,
                'customer_phone' => $request->customer_phone,
                'customer_address' => $request->customer_address,
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
