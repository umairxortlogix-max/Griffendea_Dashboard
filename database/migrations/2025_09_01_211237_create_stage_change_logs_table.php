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
        Schema::create('stage_change_logs', function (Blueprint $table) {
         


 $table->id();

    $table->uuid('contact_id');
    $table->unsignedBigInteger('opportunity_id');
    $table->uuid('pipeline_stage_id');
    $table->uuid('pipeline_id');

    $table->dateTime('start_date')->nullable();
    $table->dateTime('end_date')->nullable();

    $table->timestamps();


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stage_change_logs');
    }
};
