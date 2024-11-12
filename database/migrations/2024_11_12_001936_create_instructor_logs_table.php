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
        Schema::create('instructor_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by'); // To track the user who triggered the event
            $table->string('action'); // Type of action (INSERT, UPDATE, DELETE)
            $table->string('first_name', 50); // First name for reference
            $table->string('last_name', 50); // Last name for reference
            $table->string('email', 100); // Email for reference
            $table->unsignedBigInteger('department_id'); // Department ID for reference
            $table->json('availability_hours'); // Store the availability hours JSON structure
            $table->timestamps(); // Log entry timestamps
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instructor_logs');
    }
};
