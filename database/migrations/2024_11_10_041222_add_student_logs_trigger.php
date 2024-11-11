<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        // // Trigger for INSERT
        // DB::unprepared('
        //     CREATE TRIGGER after_student_insert
        //     AFTER INSERT ON students
        //     FOR EACH ROW
        //     BEGIN
        //         INSERT INTO student_logs (student_id, user_id, type, student_number, first_name, last_name, email, date_of_birth, year_level, enrollment_status, date_enrolled, financial_hold, created_at, updated_at)
        //         VALUES (new.student_id, new.user_id, "INSERT", new.student_number, new.first_name, new.last_name, new.email, new.date_of_birth, new.year_level, new.enrollment_status, new.date_enrolled, new.financial_hold, NOW(), NOW());
        //     END
        // ');

        // // Trigger for UPDATE
        // DB::unprepared('
        //     CREATE TRIGGER after_student_update
        //     AFTER UPDATE ON students
        //     FOR EACH ROW
        //     BEGIN
        //         INSERT INTO student_logs (student_id, user_id, type, student_number, first_name, last_name, email, date_of_birth, year_level, enrollment_status, date_enrolled, financial_hold, created_at, updated_at)
        //         VALUES (old.student_id, old.user_id, "UPDATE", old.student_number, old.first_name, old.last_name, old.email, old.date_of_birth, old.year_level, old.enrollment_status, old.date_enrolled, old.financial_hold, NOW(), NOW());
        //     END
        // ');

        // // Trigger for DELETE
        // DB::unprepared('
        //     CREATE TRIGGER after_student_delete
        //     AFTER DELETE ON students
        //     FOR EACH ROW
        //     BEGIN
        //         INSERT INTO student_logs (student_id, user_id, type, student_number, first_name, last_name, email, date_of_birth, year_level, enrollment_status, date_enrolled, financial_hold, created_at, updated_at)
        //         VALUES (old.student_id, old.user_id, "DELETE", old.student_number, old.first_name, old.last_name, old.email, old.date_of_birth, old.year_level, old.enrollment_status, old.date_enrolled, old.financial_hold, NOW(), NOW());
        //     END
        // ');
    }

    public function down()
    {
        DB::unprepared('DROP TRIGGER IF EXISTS after_student_insert');
        DB::unprepared('DROP TRIGGER IF EXISTS after_student_update');
        DB::unprepared('DROP TRIGGER IF EXISTS after_student_delete');
    }
};
