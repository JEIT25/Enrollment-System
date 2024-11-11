<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB; // Import the DB facade
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'student_id',
        'user_id',
        'type',
        'student_number',
        'first_name',
        'last_name',
        'email',
        'date_of_birth',
        'year_level',
        'enrollment_status',
        'date_enrolled',
        'financial_hold'
    ];


    protected static function booted()//ONLY UNCOMMENT(USE) IF YOU USE SEEDERS, FOR INSERTING LOGS WHEN SEEDING DATABASE WITH DUMMY DATA
    {
        static::created(function ($student) {
            // Insert a new log entry in the `student_logs` table after a student is created
            DB::table('student_logs')->insert([
                'user_id' => 1, // change accordingly to existing user_id in the database
                'type' => 'INSERT', // Type of action (e.g., INSERT)
                'student_number' => $student->student_number,
                'first_name' => $student->first_name,
                'last_name' => $student->last_name,
                'email' => $student->email,
                'date_of_birth' => $student->date_of_birth,
                'year_level' => $student->year_level,
                'enrollment_status' => $student->enrollment_status,
                'date_enrolled' => $student->date_enrolled,
                'created_at' => now(), // Timestamp of log entry creation
                'updated_at' => now(), // Timestamp of last update to log
            ]);
        });
    }
}
