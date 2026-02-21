<?php

if (! function_exists('setting')) {
    /**
     * Get a setting value by key.
     */
    function setting(string $key, mixed $default = null): mixed
    {
        return \App\Models\Setting::get($key, $default);
    }
}

if (! function_exists('format_rupiah')) {
    /**
     * Format number to Indonesian Rupiah.
     */
    function format_rupiah(int|float $amount): string
    {
        return 'Rp ' . number_format($amount, 0, ',', '.');
    }
}

if (! function_exists('cart_count')) {
    /**
     * Get total items in cart.
     */
    function cart_count(): int
    {
        $cart = session('cart', []);
        return array_sum(array_column($cart, 'quantity'));
    }
}

if (! function_exists('cart_total')) {
    /**
     * Get cart subtotal.
     */
    function cart_total(): int
    {
        $cart = session('cart', []);
        $total = 0;
        foreach ($cart as $item) {
            $total += $item['price'] * $item['quantity'];
        }
        return $total;
    }
}
