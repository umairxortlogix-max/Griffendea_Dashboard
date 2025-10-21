<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  public function up()
{
    Schema::create('calendars', function (Blueprint $table) {
        $table->id();
        $table->string('calendar_id', 255)->nullable();
        $table->string('calendar_name', 255)->nullable();
        $table->string('location_id', 255)->nullable();
        $table->timestamp('created_at')->useCurrent();
        $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
    });
}

public function down()
{
    Schema::dropIfExists('calendars');
}

};
