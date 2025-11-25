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
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('script_url');
            $table->dropColumn('result_url');
            $table->dropColumn('order_number');
            $table->decimal('amount', 10, 2)->nullable()->change();
            $table->string('currency')->default('EUR')->change();

            $table->text('script_text')->after('description')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('script_text');
            $table->string('script_url')->after('word_count')->nullable();
            $table->string('result_url')->after('word_count')->nullable();
        });
    }
};
