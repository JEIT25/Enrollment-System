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
        Schema::create('class_schedules', function (Blueprint $table) {
            $table->id('schedule_id');
            $table->unsignedBigInteger('subject_id');
            $table->unsignedBigInteger('instructor_id');
            $table->unsignedBigInteger('room_id');
            $table->time('start_time');
            $table->time( 'end_time');
            $table->enum('day_of_week', ['Monday', 'Tuesday','Wednesday','Thursday','Friday']);
            $table->unsignedBigInteger('max_students');
            $table->enum('semester',['First','Second','Summer']);

            $table->foreign('subject_id')
                ->references('subject_id')
                ->on('subjects')
                ->onDelete('cascade');

            $table->foreign('instructor_id')
                ->references('instructor_id')
                ->on('instructors')
                ->onDelete('cascade');

            $table->foreign('room_id')
                ->references('room_id')
                ->on('rooms')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('class_schedules');
    }
};
