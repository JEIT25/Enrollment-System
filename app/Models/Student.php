<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB; // Import the DB facade
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class Student extends Model
{
    use HasFactory;

    protected $primaryKey = 'student_id';
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'student_id',
        'performed_by',
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
        static::created(function ($student) {
            try {
                DB::table('student_logs')->insert([
                    'performed_by' => Auth::user()->name ?? "Admin",
                    'action' => 'INSERT',
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
            } catch (\Exception $e) {
                Log::error('Error logging student creation:', ['error' => $e->getMessage()]);
            }
        });


        // Log action when a student is updated
        static::updated(function ($student) {
            DB::table('student_logs')->insert([
                'performed_by' => Auth::user()->name ?? 1, // Authenticated user or defaults to 1
                'action' => 'UPDATE',
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
                'performed_by' => Auth::user()->name ?? 1, // Authenticated user or defaults to 1
                'action' => 'DELETE',
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
