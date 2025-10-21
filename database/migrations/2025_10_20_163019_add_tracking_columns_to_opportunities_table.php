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
        Schema::table('opportunities', function (Blueprint $table) {
           $table->dateTime('last_status_change_at')->nullable()->after('status');
            $table->dateTime('last_stage_change_at')->nullable()->after('last_status_change_at');
            $table->dateTime('last_action_date')->nullable()->after('last_stage_change_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
       Schema::table('opportunities', function (Blueprint $table) {
            $table->dropColumn([
                'last_status_change_at',
                'last_stage_change_at',
                'last_action_date',
            ]);
        });
    }
};
