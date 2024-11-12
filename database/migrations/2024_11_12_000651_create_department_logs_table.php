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
        Schema::create('department_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by'); // To track the user who triggered the event
            $table->enum('action', ['INSERT', 'UPDATE', 'DELETE']); // Type of action (INSERT, UPDATE, DELETE)
            $table->string('department_name', 500); // Department name for reference
            $table->timestamps(); // Log entry timestamps

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('department_logs');
    }
};
