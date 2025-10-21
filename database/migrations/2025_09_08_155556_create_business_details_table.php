<?php


use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('business_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('invoice_id')->nullable()->constrained('invoices')->nullOnDelete();
            $table->string('name');
            $table->text('address')->nullable();
            $table->string('phone_no', 50)->nullable();
            $table->string('website')->nullable();
            $table->string('logo_url')->nullable();
            $table->json('custom_values')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('business_details');
    }
};
