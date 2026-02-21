<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;

class DashboardController extends Controller
{
    public function index()
    {
        $totalProducts = Product::count();
        $totalOrders = Order::count();
        $pendingOrders = Order::where('status', 'pending_payment')->count();
        $todayOrders = Order::whereDate('created_at', today())->count();
        $todayRevenue = Order::whereDate('created_at', today())
            ->whereNotIn('status', ['cancelled', 'pending_payment'])
            ->sum('total_price');
        $recentOrders = Order::latest()->take(10)->get();

        return view('admin.dashboard', compact(
            'totalProducts',
            'totalOrders',
            'pendingOrders',
            'todayOrders',
            'todayRevenue',
            'recentOrders'
        ));
    }
}
