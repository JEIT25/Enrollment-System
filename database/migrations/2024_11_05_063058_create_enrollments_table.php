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
        Schema::create('enrollments', function (Blueprint $table) {
            $table->id('enrollment_id');
            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('schedule_id');
            $table->date('date_enrolled');
            $table->decimal('grade', 4, 2)->nullable();
            $table->enum("status", allowed: ['Enrolled', 'Completed', 'Dropped', 'Waitlisted'])->default('Enrolled');

            $table->foreign('student_id')
                ->references('student_id')
                ->on('students')
                ->onDelete('cascade');


            $table->foreign('schedule_id')
                ->references('schedule_id')
                ->on('class_schedules')
                ->onDelete('cascade')
                ->onUpdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enrollments');
    }
};
