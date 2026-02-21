<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\OrderTrackingController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ShippingServiceController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\SettingController;

/*
|--------------------------------------------------------------------------
| Storefront Routes
|--------------------------------------------------------------------------
*/
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/products/{slug}', [ProductController::class, 'show'])->name('products.show');

// Cart
Route::get('/cart', [CartController::class, 'index'])->name('cart.index');
Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
Route::patch('/cart/update', [CartController::class, 'update'])->name('cart.update');
Route::delete('/cart/remove', [CartController::class, 'remove'])->name('cart.remove');
Route::delete('/cart/clear', [CartController::class, 'clear'])->name('cart.clear');

// Checkout
Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout.index');
Route::post('/checkout', [CheckoutController::class, 'store'])->name('checkout.store');
Route::get('/checkout/success/{order_number}', [CheckoutController::class, 'success'])->name('checkout.success');

// Order Tracking
Route::get('/track-order', [OrderTrackingController::class, 'index'])->name('track.index');
Route::post('/track-order', [OrderTrackingController::class, 'track'])->name('track.search');
Route::post('/track-order/upload/{order_number}', [OrderTrackingController::class, 'uploadProof'])->name('track.upload');

/*
|--------------------------------------------------------------------------
| Auth Routes
|--------------------------------------------------------------------------
*/
Route::get('/admin/login', [LoginController::class, 'showLoginForm'])->name('admin.login');
Route::post('/admin/login', [LoginController::class, 'login'])->name('admin.login.submit');
Route::post('/admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
*/
Route::prefix('admin')->middleware(['auth', 'admin'])->name('admin.')->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

    Route::resource('products', AdminProductController::class)->except(['show']);
    Route::resource('categories', CategoryController::class)->except(['show']);

    Route::get('orders', [OrderController::class, 'index'])->name('orders.index');
    Route::get('orders/{order}', [OrderController::class, 'show'])->name('orders.show');
    Route::patch('orders/{order}/status', [OrderController::class, 'updateStatus'])->name('orders.status');

    Route::resource('shipping', ShippingServiceController::class)->except(['show']);

    Route::resource('sliders', SliderController::class)->except(['show']);

    Route::get('settings', [SettingController::class, 'index'])->name('settings.index');
    Route::put('settings', [SettingController::class, 'update'])->name('settings.update');
});

/*
|--------------------------------------------------------------------------
| Setup Route (remove after deployment)
|--------------------------------------------------------------------------
*/
Route::get('/setup/{token}', function (string $token) {
    if ($token !== 'soeka-setup-2026') {
        abort(403);
    }

    Artisan::call('migrate', ['--force' => true]);
    $migrate = Artisan::output();

    Artisan::call('db:seed', ['--force' => true]);
    $seed = Artisan::output();

    Artisan::call('storage:link');
    $link = Artisan::output();

    return "<pre>== MIGRATE ==\n{$migrate}\n== SEED ==\n{$seed}\n== STORAGE LINK ==\n{$link}</pre>";
});
