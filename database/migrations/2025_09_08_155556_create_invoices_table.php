<?php


use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->enum('status', ['draft','sent','paid','overdue','cancelled'])->default('draft');
            $table->boolean('live_mode')->default(false);
            $table->string('name')->nullable();
             $table->string('location_id', 255)->nullable();
            $table->string('invoice_number', 100);
            $table->string('title')->nullable();
            $table->string('currency', 10)->default('USD');

            // Contact details
            $table->string('contact_id', 100)->nullable();

            // Invoice meta
            $table->date('issue_date');
            $table->date('due_date')->nullable();
            $table->enum('discount_type', ['percentage','fixed'])->default('fixed');
            $table->decimal('discount_value', 10, 2)->default(0);
            $table->decimal('subtotal', 10, 2)->default(0);
            $table->decimal('total', 10, 2)->default(0);
            $table->decimal('amount_paid', 10, 2)->default(0);
            $table->decimal('amount_due', 10, 2)->default(0);
            $table->text('notes')->nullable();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
