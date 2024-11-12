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
        Schema::create('room_logs', function (Blueprint $table) {
            $table->id('log_id');
            $table->string('performed_by'); // To track the user who triggered the event
            $table->string('room_number', 20);
            $table->string('building_name', 100);
            $table->unsignedBigInteger('room_capacity');
            $table->enum('room_type', ['Lecture', 'Laboratory', 'Studio', 'Seminar']);
            $table->enum('action', ['INSERT', 'UPDATE','DELETE']); // Type of action
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('room_logs');
    }
};
