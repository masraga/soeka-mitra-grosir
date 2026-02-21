<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ShippingService;
use Illuminate\Http\Request;

class ShippingServiceController extends Controller
{
    public function index()
    {
        $services = ShippingService::orderBy('sort_order')->paginate(15);
        return view('admin.shipping.index', compact('services'));
    }

    public function create()
    {
        return view('admin.shipping.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'cost' => 'required|integer|min:0',
            'estimated_delivery' => 'nullable|string|max:255',
            'is_active' => 'boolean',
            'sort_order' => 'integer|min:0',
        ]);

        ShippingService::create([
            'name' => $request->name,
            'description' => $request->description,
            'cost' => $request->cost,
            'estimated_delivery' => $request->estimated_delivery,
            'is_active' => $request->boolean('is_active', true),
            'sort_order' => $request->sort_order ?? 0,
        ]);

        return redirect()->route('admin.shipping.index')->with('success', 'Jasa kirim berhasil ditambahkan.');
    }

    public function edit(ShippingService $shipping)
    {
        return view('admin.shipping.edit', compact('shipping'));
    }

    public function update(Request $request, ShippingService $shipping)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'cost' => 'required|integer|min:0',
            'estimated_delivery' => 'nullable|string|max:255',
            'is_active' => 'boolean',
            'sort_order' => 'integer|min:0',
        ]);

        $shipping->update([
            'name' => $request->name,
            'description' => $request->description,
            'cost' => $request->cost,
            'estimated_delivery' => $request->estimated_delivery,
            'is_active' => $request->boolean('is_active', true),
            'sort_order' => $request->sort_order ?? 0,
        ]);

        return redirect()->route('admin.shipping.index')->with('success', 'Jasa kirim berhasil diperbarui.');
    }

    public function destroy(ShippingService $shipping)
    {
        $shipping->delete();
        return redirect()->route('admin.shipping.index')->with('success', 'Jasa kirim berhasil dihapus.');
    }
}
