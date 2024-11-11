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
        Schema::create('students', function (Blueprint $table) {
            $table->id('student_id');
            $table->string('student_number',20);
            $table->string('first_name',50);
            $table->string('last_name',50);
            $table->string('email',100);
            $table->date('date_of_birth');
            $table->unsignedBigInteger('year_level');
            $table->enum('enrollment_status',['Active','Inactive','Graduated']);
            $table->date('date_enrolled');
            $table->boolean('financial_hold')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('students');
    }
};
