<?php


use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('responses', function (Blueprint $table) {
            $table->id(); // bigint unsigned auto_increment primary key
            $table->string('contact_id', 200)->nullable()->index();
            $table->unsignedBigInteger('assigned_user_id')->nullable()->index();
            $table->timestamp('date_created')->nullable();
            $table->timestamp('first_response')->nullable();
            $table->timestamps(); // created_at, updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('responses');
    }
};
