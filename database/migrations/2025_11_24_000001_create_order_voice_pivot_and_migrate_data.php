<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // 1) Create pivot table
        Schema::create('order_voice', function (Blueprint $table) {
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('voice_id');
            $table->timestamps();

            $table->primary(['order_id', 'voice_id']);
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('voice_id')->references('id')->on('voices')->onDelete('cascade');
        });

        // 2) Backfill existing data from orders.voice_id to pivot
        if (Schema::hasColumn('orders', 'voice_id')) {
            // Insert unique pairs order_id/voice_id
            $pairs = DB::table('orders')
                ->select(['id as order_id', 'voice_id'])
                ->whereNotNull('voice_id')
                ->get();

            // Chunk insert to avoid large single insert
            $now = now();
            $chunk = [];
            foreach ($pairs as $p) {
                $chunk[] = [
                    'order_id' => $p->order_id,
                    'voice_id' => $p->voice_id,
                    'created_at' => $now,
                    'updated_at' => $now,
                ];
                if (count($chunk) >= 1000) {
                    DB::table('order_voice')->insert($chunk);
                    $chunk = [];
                }
            }
            if (! empty($chunk)) {
                DB::table('order_voice')->insert($chunk);
            }

            // 3) Drop foreign key and column voice_id from orders
            Schema::table('orders', function (Blueprint $table) {
                // Drop FK if exists
                try {
                    $table->dropForeign(['voice_id']);
                } catch (Throwable $e) {
                    // ignore if not exists
                }
                $table->dropColumn('voice_id');
            });
        }
    }

    public function down(): void
    {
        // Re-add voice_id to orders
        if (! Schema::hasColumn('orders', 'voice_id')) {
            Schema::table('orders', function (Blueprint $table) {
                $table->foreignId('voice_id')->nullable()->constrained()->onDelete('cascade');
            });

            // Repopulate orders.voice_id with the first attached voice (if any)
            $orderIds = DB::table('orders')->pluck('id');
            foreach ($orderIds as $orderId) {
                $first = DB::table('order_voice')->where('order_id', $orderId)->orderBy('voice_id')->first();
                if ($first) {
                    DB::table('orders')->where('id', $orderId)->update(['voice_id' => $first->voice_id]);
                }
            }
        }

        // Drop pivot
        Schema::dropIfExists('order_voice');
    }
};
