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
        Schema::create('subjects', function (Blueprint $table) {
            $table->id('subject_id');
            $table->string('subject_code', 20);
            $table->string('subject_name',100);
            $table->unsignedBigInteger('credits');
            $table->unsignedBigInteger('department_id');
            $table->unsignedBigInteger('pre_requisite_subject_id')->nullable();
            $table->unsignedBigInteger('co_requisite_subject_id')->nullable();
            $table->unsignedBigInteger('weekly_hours');
            $table->enum('semester', ['First', 'Second', 'Summer']);

            $table->foreign('department_id')
                ->references('department_id')
                ->on('departments')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('subjects');
    }
};
