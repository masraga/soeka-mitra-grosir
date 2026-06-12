<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    protected $fillable = [
        'order_number',
        'customer_name',
        'customer_first_name',
        'customer_last_name',
        'customer_email',
        'customer_phone',
        'customer_country_code',
        'customer_address',
        'customer_address_line_1',
        'customer_address_line_2',
        'customer_city',
        'customer_province',
        'customer_postal_code',
        'notes',
        'shipping_service_id',
        'shipping_service_name',
        'shipping_cost',
        'subtotal',
        'total_price',
        'status',
        'payment_proof',
        'payment_deadline',
    ];

    protected function casts(): array
    {
        return [
            'subtotal' => 'integer',
            'total_price' => 'integer',
            'shipping_cost' => 'integer',
            'payment_deadline' => 'datetime',
        ];
    }

    public function items(): HasMany
    {
        return $this->hasMany(OrderItem::class);
    }

    public function shippingService(): BelongsTo
    {
        return $this->belongsTo(ShippingService::class);
    }

    public function getCustomerFullNameAttribute(): string
    {
        $name = trim(implode(' ', array_filter([
            $this->customer_first_name,
            $this->customer_last_name,
        ])));

        return $name !== '' ? $name : $this->customer_name;
    }

    public function getCustomerCountryAttribute(): ?string
    {
        if (! $this->customer_country_code) {
            return null;
        }

        return config('locations.countries.'.$this->customer_country_code, $this->customer_country_code);
    }

    public function getCustomerFormattedAddressAttribute(): string
    {
        $address = array_filter([
            $this->customer_address_line_1,
            $this->customer_address_line_2,
            implode(', ', array_filter([$this->customer_city, $this->customer_province])),
            trim(implode(' ', array_filter([$this->customer_postal_code, $this->customer_country]))),
        ]);

        return $address ? implode("\n", $address) : $this->customer_address;
    }

    public function getIsExpiredAttribute(): bool
    {
        if ($this->status !== 'pending_payment') {
            return false;
        }

        return $this->payment_deadline && $this->payment_deadline->isPast();
    }

    public function getTimeRemainingAttribute(): ?string
    {
        if ($this->status !== 'pending_payment' || ! $this->payment_deadline) {
            return null;
        }

        if ($this->payment_deadline->isPast()) {
            return 'Kedaluwarsa';
        }

        return $this->payment_deadline->diffForHumans(now(), [
            'parts' => 2,
            'short' => true,
        ]);
    }

    public function getStatusLabelAttribute(): string
    {
        return match ($this->status) {
            'pending_payment' => 'Menunggu Pembayaran',
            'payment_confirmed' => 'Pembayaran Dikonfirmasi',
            'processing' => 'Diproses',
            'shipped' => 'Dikirim',
            'completed' => 'Selesai',
            'cancelled' => 'Dibatalkan',
            default => $this->status,
        };
    }

    public function getStatusColorAttribute(): string
    {
        return match ($this->status) {
            'pending_payment' => 'bg-yellow-100 text-yellow-800',
            'payment_confirmed' => 'bg-blue-100 text-blue-800',
            'processing' => 'bg-indigo-100 text-indigo-800',
            'shipped' => 'bg-purple-100 text-purple-800',
            'completed' => 'bg-green-100 text-green-800',
            'cancelled' => 'bg-red-100 text-red-800',
            default => 'bg-gray-100 text-gray-800',
        };
    }

    /**
     * Generate a unique order number.
     */
    public static function generateOrderNumber(): string
    {
        $date = now()->format('Ymd');
        $lastOrder = static::where('order_number', 'like', "ORD-{$date}-%")
            ->orderBy('id', 'desc')
            ->first();

        if ($lastOrder) {
            $lastNumber = (int) substr($lastOrder->order_number, -5);
            $newNumber = $lastNumber + 1;
        } else {
            $newNumber = 1;
        }

        return "ORD-{$date}-".str_pad($newNumber, 5, '0', STR_PAD_LEFT);
    }
}
