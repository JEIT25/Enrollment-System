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
            $table->enum('action', ['INSERT', 'UPDATE', 'DELETE']); // Type of action (INSERT, UPDATE, DELETE)
            $table->unsignedBigInteger('department_id'); // ID of the affected department
            $table->unsignedBigInteger('user_id'); // ID of the affected department
            $table->string('department_name', 500); // Department name for reference
            $table->timestamps(); // Log entry timestamps

            $table->foreign('user_id')
                ->references('user_id')
                ->on('users');
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
