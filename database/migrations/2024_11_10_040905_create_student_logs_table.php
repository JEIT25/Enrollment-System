<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('student_logs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id'); // To track the user who triggered the event
            $table->enum('type', ['INSERT', 'UPDATE', 'DELETE']);

            // Columns to store each attribute's value separately
            $table->string('student_number', 20)->nullable();
            $table->string('first_name', 50)->nullable();
            $table->string('last_name', 50)->nullable();
            $table->string('email', 100)->nullable();
            $table->date('date_of_birth')->nullable();
            $table->unsignedBigInteger('year_level')->nullable();
            $table->enum('enrollment_status', ['Active', 'Inactive', 'Graduated'])->nullable();
            $table->date('date_enrolled')->nullable();
            $table->boolean('financial_hold')->default(false);

            $table->timestamps();

            $table->foreign('user_id')->references('user_id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('student_logs');
    }
};
