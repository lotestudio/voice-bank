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
        Schema::create('voice_feature_values', function (Blueprint $table) {
            $table->id();
            $table->foreignId('voice_id')->constrained()->onDelete('cascade');
            $table->foreignId('feature_value_id')->constrained()->onDelete('cascade');
            $table->timestamps();

            // Ensure each voice has each feature only once
            $table->unique(['voice_id', 'feature_value_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('voice_feature_values');
    }
};
