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
        Schema::create('samples', function (Blueprint $table) {
            $table->id();
            $table->foreignId('voice_id')->constrained()->onDelete('cascade'); // The voice the sample belongs to
            $table->json('title'); // Translatable title
            $table->json('description')->nullable(); // Translatable description
            $table->string('file_url'); // URL to the audio file
            $table->string('file_type')->default('mp3'); // File type (mp3, wav, etc.)
            $table->unsignedInteger('duration')->nullable(); // Duration in seconds
            $table->unsignedInteger('file_size')->nullable(); // File size in bytes
            $table->boolean('is_featured')->default(false); // Whether this is a featured sample
            $table->integer('sort_order')->default(0); // For controlling the display order
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('samples');
    }
};
