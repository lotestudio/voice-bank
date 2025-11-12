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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // The client who placed the order
            $table->foreignId('voice_id')->constrained()->onDelete('cascade'); // The voice being ordered
            $table->string('order_number')->unique(); // Unique order number for reference
            $table->string('title'); // Translatable title of the project
            $table->text('description')->nullable(); // Translatable description of the project
            $table->decimal('amount', 10, 2); // Order amount
            $table->string('currency', 3)->default('USD'); // Currency code (USD, EUR, etc.)
            $table->enum('status', ['pending', 'accepted', 'in_progress', 'completed', 'cancelled', 'refunded'])->default('pending');
            $table->date('deadline')->nullable(); // Deadline for the project
            $table->integer('word_count')->nullable(); // Number of words in the script
            $table->string('script_url')->nullable(); // URL to the script file
            $table->string('result_url')->nullable(); // URL to the result file
            $table->text('notes')->nullable(); // Translatable notes from the client
            $table->text('artist_notes')->nullable(); // Translatable notes from the artist
            $table->timestamp('accepted_at')->nullable(); // When the order was accepted by the artist
            $table->timestamp('completed_at')->nullable(); // When the order was completed
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
