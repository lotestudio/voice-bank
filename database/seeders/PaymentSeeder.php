<?php

namespace Database\Seeders;

use App\Models\Order;
use App\Models\Payment;
use Illuminate\Database\Seeder;

class PaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all orders
        $orders = Order::all();

        // For each order, create appropriate payments based on status
        foreach ($orders as $order) {
            // For completed orders, create a successful payment
            if ($order->isCompleted()) {
                Payment::factory()
                    ->completed()
                    ->forOrder($order)
                    ->create();

                // 20% chance to have a failed payment attempt before the successful one
                if (fake()->boolean(20)) {
                    Payment::factory()
                        ->failed()
                        ->forOrder($order)
                        ->create([
                            'created_at' => $order->created_at->copy()->addDays(1),
                            'updated_at' => $order->created_at->copy()->addDays(1),
                        ]);
                }
            }

            // For refunded orders, create a completed payment and then a refund
            elseif ($order->isRefunded()) {
                $completedPayment = Payment::factory()
                    ->completed()
                    ->forOrder($order)
                    ->create([
                        'created_at' => $order->created_at->copy()->addDays(1),
                        'updated_at' => $order->created_at->copy()->addDays(1),
                        'paid_at' => $order->created_at->copy()->addDays(1),
                    ]);

                Payment::factory()
                    ->refunded()
                    ->forOrder($order)
                    ->create([
                        'created_at' => $completedPayment->paid_at->copy()->addDays(rand(1, 5)),
                        'updated_at' => $completedPayment->paid_at->copy()->addDays(rand(1, 5)),
                        'paid_at' => $completedPayment->paid_at,
                        'refunded_at' => $completedPayment->paid_at->copy()->addDays(rand(1, 5)),
                    ]);
            }

            // For cancelled orders, 50% chance to have a failed payment
            elseif ($order->isCancelled() && fake()->boolean(50)) {
                Payment::factory()
                    ->failed()
                    ->forOrder($order)
                    ->create();
            }

            // For pending orders, 30% chance to have a pending payment
            elseif ($order->isPending() && fake()->boolean(30)) {
                Payment::factory()
                    ->pending()
                    ->forOrder($order)
                    ->create();
            }

            // For accepted or in-progress orders, 70% chance to have a completed payment
            elseif (($order->isAccepted() || $order->isInProgress()) && fake()->boolean(70)) {
                Payment::factory()
                    ->completed()
                    ->forOrder($order)
                    ->create();
            }
        }

        // Create some additional random payments
        Payment::factory()
            ->count(10)
            ->create();

        // Create some payments with specific statuses to ensure we have a good distribution
        $statuses = ['pending', 'completed', 'failed', 'refunded'];
        foreach ($statuses as $status) {
            Payment::factory()
                ->count(3)
                ->state(['status' => $status])
                ->create();
        }
    }
}
