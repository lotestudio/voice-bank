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
        Schema::create('feature_values', function (Blueprint $table) {
            $table->id();
            $table->foreignId('feature_id')->constrained()->onDelete('cascade');
            $table->string('value');
            $table->json('display_value');
            $table->json('description')->nullable();
            $table->integer('sort_order')->default(0); // For controlling the display order
            $table->timestamps();

            // Ensure each value is unique per feature
            $table->unique(['feature_id', 'value']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('feature_values');
    }
};
