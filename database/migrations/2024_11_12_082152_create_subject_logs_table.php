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
        Schema::create('subject_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by');
            $table->enum('action',['INSERT','UPDATE','DELETE']);
            $table->string('subject_code', 20);
            $table->string('subject_name', 100);
            $table->unsignedBigInteger('credits');
            $table->unsignedBigInteger('department_id');
            $table->unsignedBigInteger('pre_requisite_subject_id')->nullable();
            $table->unsignedBigInteger('co_requisite_subject_id')->nullable();
            $table->unsignedBigInteger('weekly_hours');
            $table->enum('semester', ['First', 'Second', 'Summer']);
            $table->timestamps();
            
            $table->foreign('department_id')
                ->references('department_id')
                ->on('departments')
                ->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subject_logs');
    }
};