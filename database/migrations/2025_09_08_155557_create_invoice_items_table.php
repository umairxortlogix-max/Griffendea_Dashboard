<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('invoice_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('invoice_id')->constrained('invoices')->cascadeOnDelete();
            $table->string('product_id', 100)->nullable();
            $table->string('price_id', 100)->nullable();
            $table->string('currency', 10)->default('USD');
            $table->string('name');
            $table->integer('qty')->default(1);
            $table->decimal('amount', 10, 2);
            $table->json('taxes')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('invoice_items');
    }
};
