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
        Schema::create('enrollment_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by');
            $table->enum('action',['INSERT','UPDATE','DELETE']);
            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('schedule_id');
            $table->date('date_enrolled');
            $table->decimal('grade', 4, 2)->nullable();
            $table->enum("status", allowed: ['Enrolled', 'Completed', 'Dropped', 'Waitlisted'])->default('Enrolled');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enrollment_logs');
    }
};
