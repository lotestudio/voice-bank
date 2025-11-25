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
        Schema::table('order_voice', function (Blueprint $table) {
            $table->text('artist_notes')->nullable()->after('voice_id');
        });

        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('artist_notes');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('order_voice', function (Blueprint $table) {
            $table->dropColumn('artist_notes');
        });

        Schema::table('orders', function (Blueprint $table) {
            $table->text('artist_notes')->nullable()->after('notes');
        });
    }
};
