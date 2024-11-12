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
        Schema::create('class_schedule_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by');
            $table->enum('action',['INSERT','UPDATE','DELETE']);
            $table->unsignedBigInteger('subject_id');
            $table->unsignedBigInteger('instructor_id');
            $table->unsignedBigInteger('room_id');
            $table->time('start_time');
            $table->time('end_time');
            $table->enum('day_of_week', ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']);
            $table->unsignedBigInteger('max_students');
            $table->enum('semester', ['First', 'Second', 'Summer']);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('class_schedule_logs');
    }
};
