<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderTrackingController extends Controller
{
    public function index()
    {
        return view('track-order');
    }

    public function track(Request $request)
    {
        $request->validate([
            'order_number' => 'required|string',
            'customer_phone' => 'required|string',
        ]);

        $order = Order::where('order_number', $request->order_number)
            ->where('customer_phone', $request->customer_phone)
            ->with('items')
            ->first();

        if (!$order) {
            return back()
                ->withInput()
                ->with('error', 'Pesanan tidak ditemukan. Pastikan nomor pesanan dan nomor telepon benar.');
        }

        return view('track-order', compact('order'));
    }

    public function uploadProof(Request $request, string $orderNumber)
    {
        $request->validate([
            'payment_proof' => 'required|image|mimes:jpeg,png,jpg|max:2048',
            'customer_phone' => 'required|string',
        ]);

        $order = Order::where('order_number', $orderNumber)
            ->where('customer_phone', $request->customer_phone)
            ->firstOrFail();

        if ($order->status !== 'pending_payment') {
            return back()->with('error', 'Status pesanan tidak memungkinkan upload bukti pembayaran.');
        }

        if ($order->is_expired) {
            return back()->with('error', 'Batas waktu pembayaran telah berakhir. Pesanan dibatalkan.');
        }

        $path = $request->file('payment_proof')->store('proofs', 'public');

        $order->update(['payment_proof' => $path]);

        return back()->with('success', 'Bukti pembayaran berhasil diupload. Menunggu konfirmasi admin.');
    }
}
