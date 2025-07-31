<?php

namespace Database\Factories;

use App\Models\Order;
use App\Models\Payment;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Payment>
 */
class PaymentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $statuses = ['pending', 'completed', 'failed', 'refunded'];
        $status = $statuses[array_rand($statuses)];
        $paymentMethods = ['credit_card', 'paypal', 'bank_transfer', 'stripe', 'apple_pay', 'google_pay'];
        $paymentMethod = $paymentMethods[array_rand($paymentMethods)];
        $amount = fake()->randomFloat(2, 50, 1000);
        $currencies = ['USD', 'EUR', 'GBP'];
        $currency = $currencies[array_rand($currencies)];

        // Generate dates based on status
        $paidAt = null;
        $refundedAt = null;

        if ($status === 'completed' || $status === 'refunded') {
            $paidAt = now()->subDays(rand(1, 30));
        }

        if ($status === 'refunded') {
            $refundedAt = $paidAt ? $paidAt->copy()->addDays(rand(1, 14)) : now()->subDays(rand(1, 14));
        }

        // Generate payment details
        $paymentDetails = [
            'transaction_id' => strtoupper(fake()->bothify('??####??####')),
            'payment_method_details' => [
                'type' => $paymentMethod,
                'last4' => $paymentMethod === 'credit_card' ? fake()->numerify('####') : null,
                'brand' => $paymentMethod === 'credit_card' ? fake()->randomElement(['visa', 'mastercard', 'amex', 'discover']) : null,
            ],
            'billing_details' => [
                'name' => fake()->name(),
                'email' => fake()->email(),
                'address' => [
                    'line1' => fake()->streetAddress(),
                    'city' => fake()->city(),
                    'country' => fake()->countryCode(),
                    'postal_code' => fake()->postcode(),
                ],
            ],
        ];

        return [
            'order_id' => Order::factory(),
            'user_id' => User::factory()->client(),
            'payment_id' => Payment::generatePaymentId(),
            'payment_method' => $paymentMethod,
            'amount' => $amount,
            'currency' => $currency,
            'status' => $status,
            'payment_details' => $paymentDetails,
            'paid_at' => $paidAt,
            'refunded_at' => $refundedAt,
        ];
    }

    /**
     * Indicate that the payment is pending.
     */
    public function pending(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'pending',
            'paid_at' => null,
            'refunded_at' => null,
        ]);
    }

    /**
     * Indicate that the payment is completed.
     */
    public function completed(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'completed',
            'paid_at' => now()->subDays(rand(1, 7)),
            'refunded_at' => null,
        ]);
    }

    /**
     * Indicate that the payment has failed.
     */
    public function failed(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'failed',
            'paid_at' => null,
            'refunded_at' => null,
        ]);
    }

    /**
     * Indicate that the payment has been refunded.
     */
    public function refunded(): static
    {
        $paidAt = now()->subDays(rand(7, 14));

        return $this->state(fn (array $attributes) => [
            'status' => 'refunded',
            'paid_at' => $paidAt,
            'refunded_at' => $paidAt->copy()->addDays(rand(1, 7)),
        ]);
    }

    /**
     * Indicate that the payment belongs to a specific order.
     */
    public function forOrder(Order $order): static
    {
        return $this->state(fn (array $attributes) => [
            'order_id' => $order->id,
            'user_id' => $order->user_id,
            'amount' => $order->amount,
            'currency' => $order->currency,
        ]);
    }

    /**
     * Indicate that the payment belongs to a specific user.
     */
    public function forUser(User $user): static
    {
        return $this->state(fn (array $attributes) => [
            'user_id' => $user->id,
        ]);
    }
}
