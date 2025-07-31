<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained()->onDelete('cascade'); // The order being paid for
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // The user making the payment
            $table->string('payment_id')->unique(); // Payment ID from the payment gateway
            $table->string('payment_method'); // Payment method (credit card, PayPal, etc.)
            $table->decimal('amount', 10, 2); // Payment amount
            $table->string('currency', 3)->default('USD'); // Currency code (USD, EUR, etc.)
            $table->enum('status', ['pending', 'completed', 'failed', 'refunded'])->default('pending');
            $table->json('payment_details')->nullable(); // JSON data from the payment gateway
            $table->timestamp('paid_at')->nullable(); // When the payment was completed
            $table->timestamp('refunded_at')->nullable(); // When the payment was refunded
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payments');
    }
};
