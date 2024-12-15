<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Enrollment extends Model
{
    use HasFactory;
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'enrollment_id',
        'student_id',
        'schedule_id',
        'date_enrolled',
        'grade',
        'status',
    ];

    protected static function booted()
    {
        // Insert log entry on create
        static::created(function ($enrollment) {
            DB::table('enrollment_logs')->insert([
                'performed_by' => Auth::check() ? Auth::user()->name : 'Admin',
                'action' => 'INSERT',
                'student_id' => $enrollment->student_id,
                'schedule_id' => $enrollment->schedule_id,
                'date_enrolled' => $enrollment->date_enrolled,
                'grade' => $enrollment->grade ?? 0.00,
                'status' => $enrollment->status ?? "Enrolled",
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Update log entry on update
        static::updated(function ($enrollment) {
            DB::table('enrollment_logs')->insert([
                'performed_by' => Auth::check() ? Auth::user()->name : 'Admin',
                'action' => 'UPDATE',
                'student_id' => $enrollment->student_id,
                'schedule_id' => $enrollment->schedule_id,
                'date_enrolled' => $enrollment->date_enrolled,
                'grade' => $enrollment->grade,
                'status' => $enrollment->status,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Delete log entry on delete
        static::deleted(function ($enrollment) {
            DB::table('enrollment_logs')->insert([
                'performed_by' => Auth::check() ? Auth::user()->name : 'Admin',
                'action' => 'DELETE',
                'student_id' => $enrollment->student_id,
                'schedule_id' => $enrollment->schedule_id,
                'date_enrolled' => $enrollment->date_enrolled,
                'grade' => $enrollment->grade,
                'status' => $enrollment->status,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}
