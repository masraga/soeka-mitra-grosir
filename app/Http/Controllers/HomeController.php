<?php

namespace App\Http\Controllers;

use App\Models\Product;

class HomeController extends Controller
{
    public function index()
    {
        $banners = collect();
        $bannerPath = public_path('banner');

        if (is_dir($bannerPath)) {
            $files = scandir($bannerPath);
            $allowedExtensions = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

            foreach ($files as $file) {
                $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
                if (in_array($ext, $allowedExtensions)) {
                    $banners->push($file);
                }
            }

            $banners = $banners->sort()->values();
        }

        $latestProducts = Product::active()
            ->where('stock', '>', 0)
            ->latest()
            ->take(12)
            ->get();

        return view('home', compact('banners', 'latestProducts'));
    }
}
