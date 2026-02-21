<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $cart = session('cart', []);
        return view('cart.index', compact('cart'));
    }

    public function add(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
        ]);

        $product = Product::findOrFail($request->product_id);

        if (!$product->is_active || $product->stock < 1) {
            return back()->with('error', 'Produk tidak tersedia.');
        }

        $cart = session('cart', []);
        $productId = (string) $product->id;

        if (isset($cart[$productId])) {
            $newQty = $cart[$productId]['quantity'] + $request->quantity;
            if ($newQty > $product->stock) {
                return back()->with('error', 'Jumlah melebihi stok tersedia (' . $product->stock . ').');
            }
            $cart[$productId]['quantity'] = $newQty;
        } else {
            if ($request->quantity > $product->stock) {
                return back()->with('error', 'Jumlah melebihi stok tersedia (' . $product->stock . ').');
            }
            $cart[$productId] = [
                'product_id' => $product->id,
                'name' => $product->name,
                'price' => $product->price,
                'image' => $product->image,
                'quantity' => $request->quantity,
                'stock' => $product->stock,
            ];
        }

        session(['cart' => $cart]);

        return back()->with('success', $product->name . ' ditambahkan ke keranjang.');
    }

    public function update(Request $request)
    {
        $request->validate([
            'product_id' => 'required',
            'quantity' => 'required|integer|min:1',
        ]);

        $cart = session('cart', []);
        $productId = (string) $request->product_id;

        if (isset($cart[$productId])) {
            $product = Product::find($request->product_id);
            if ($product && $request->quantity > $product->stock) {
                return back()->with('error', 'Jumlah melebihi stok tersedia (' . $product->stock . ').');
            }
            $cart[$productId]['quantity'] = $request->quantity;
            session(['cart' => $cart]);
        }

        return back()->with('success', 'Keranjang diperbarui.');
    }

    public function remove(Request $request)
    {
        $cart = session('cart', []);
        $productId = (string) $request->product_id;

        unset($cart[$productId]);
        session(['cart' => $cart]);

        return back()->with('success', 'Produk dihapus dari keranjang.');
    }

    public function clear()
    {
        session()->forget('cart');
        return back()->with('success', 'Keranjang dikosongkan.');
    }
}
