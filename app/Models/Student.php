<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Auth;
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


    protected static function booted()
    {
        // Log action when a student is created
        static::created(function ($student) {
            DB::table('student_logs')->insert([
                'user_id' => Auth::id() ?? 1, // Authenticated user or defaults to 1
                'type' => 'INSERT',
                'student_number' => $student->student_number,
                'first_name' => $student->first_name,
                'last_name' => $student->last_name,
                'email' => $student->email,
                'date_of_birth' => $student->date_of_birth,
                'year_level' => $student->year_level,
                'enrollment_status' => $student->enrollment_status,
                'date_enrolled' => $student->date_enrolled,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when a student is updated
        static::updated(function ($student) {
            DB::table('student_logs')->insert([
                'user_id' => Auth::id() ?? 1, // Authenticated user or defaults to 1
                'type' => 'UPDATE',
                'student_number' => $student->student_number,
                'first_name' => $student->first_name,
                'last_name' => $student->last_name,
                'email' => $student->email,
                'date_of_birth' => $student->date_of_birth,
                'year_level' => $student->year_level,
                'enrollment_status' => $student->enrollment_status,
                'date_enrolled' => $student->date_enrolled,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when a student is deleted
        static::deleted(function ($student) {
            DB::table('student_logs')->insert([
                'user_id' => Auth::id() ?? 1, // Authenticated user or defaults to 1
                'type' => 'DELETE',
                'student_number' => $student->student_number,
                'first_name' => $student->first_name,
                'last_name' => $student->last_name,
                'email' => $student->email,
                'date_of_birth' => $student->date_of_birth,
                'year_level' => $student->year_level,
                'enrollment_status' => $student->enrollment_status,
                'date_enrolled' => $student->date_enrolled,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}
