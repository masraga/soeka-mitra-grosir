<?php

namespace App\Console\Commands;

use App\Models\Order;
use Illuminate\Console\Command;

class CancelExpiredOrders extends Command
{
    protected $signature = 'orders:cancel-expired';
    protected $description = 'Cancel orders that have passed their payment deadline';

    public function handle(): int
    {
        $expiredOrders = Order::where('status', 'pending_payment')
            ->whereNotNull('payment_deadline')
            ->where('payment_deadline', '<', now())
            ->get();

        $count = 0;

        foreach ($expiredOrders as $order) {
            $order->update(['status' => 'cancelled']);

            // Restore product stock
            foreach ($order->items as $item) {
                if ($item->product) {
                    $item->product->increment('stock', $item->quantity);
                }
            }

            $count++;
        }

        $this->info("Cancelled {$count} expired order(s).");

        return Command::SUCCESS;
    }
}
