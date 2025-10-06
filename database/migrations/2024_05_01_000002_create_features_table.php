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
        Schema::create('features', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->json('display_name');
            $table->json('description')->nullable();
            $table->boolean('is_featured')->default(true); // Whether this feature is shown in the featured section
            $table->integer('sort_order')->default(0); // For controlling the display order
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('features');
    }
};
