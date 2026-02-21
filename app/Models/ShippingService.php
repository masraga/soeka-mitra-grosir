<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShippingService extends Model
{
    protected $fillable = [
        'name',
        'description',
        'cost',
        'estimated_delivery',
        'is_active',
        'sort_order',
    ];

    protected function casts(): array
    {
        return [
            'cost' => 'integer',
            'is_active' => 'boolean',
        ];
    }

    public function scopeActive($query)
    {
        return $query->where('is_active', true)->orderBy('sort_order');
    }

    public function getFormattedCostAttribute(): string
    {
        return $this->cost > 0 ? format_rupiah($this->cost) : 'Gratis';
    }
}
