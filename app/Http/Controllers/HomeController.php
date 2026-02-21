<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Slider;

class HomeController extends Controller
{
    public function index()
    {
        $sliders = Slider::active()->get();
        $latestProducts = Product::active()
            ->where('stock', '>', 0)
            ->latest()
            ->take(12)
            ->get();

        return view('home', compact('sliders', 'latestProducts'));
    }
}
