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
        Schema::create('reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // The client who left the review
            $table->foreignId('voice_id')->constrained()->onDelete('cascade'); // The voice being reviewed
            $table->unsignedTinyInteger('rating')->default(5); // Rating from 1 to 5
            $table->json('comment')->nullable(); // Translatable comment
            $table->boolean('is_approved')->default(false); // Whether the review is approved and visible
            $table->timestamps();

            // Ensure a user can only review a voice once
            $table->unique(['user_id', 'voice_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reviews');
    }
};
