<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ClassSchedule extends Model
{
    use HasFactory;
    protected $primaryKey = 'schedule_id';
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'schedule_id',
        'subject_id',
        'instructor_id',
        'room_id',
        'start_time',
        'end_time',
        'day_of_week',
        'max_students',
        'semester'
    ];

    protected static function booted()
    {
        // Log action when a class schedule is created
        static::created(function ($classSchedule) {
            DB::table('class_schedule_logs')->insert([
                'performed_by' => Auth::user()->name ?? 'Admin', // The name of the user performing the action, defaults to 'Admin' if no user
                'action' => 'INSERT', // Type of action logged
                'subject_id' => $classSchedule->subject_id,
                'instructor_id' => $classSchedule->instructor_id,
                'room_id' => $classSchedule->room_id,
                'start_time' => $classSchedule->start_time,
                'end_time' => $classSchedule->end_time,
                'day_of_week' => $classSchedule->day_of_week,
                'max_students' => $classSchedule->max_students,
                'semester' => $classSchedule->semester,
                'created_at' => now(), // Timestamp for log entry
                'updated_at' => now(), // Timestamp for log update (if needed)
            ]);
        });

        // Log action when a class schedule is updated
        static::updated(function ($classSchedule) {
            DB::table('class_schedule_logs')->insert([
                'performed_by' => Auth::user()->name ?? 'Admin', // The name of the user performing the action, defaults to 'Admin' if no user
                'action' => 'UPDATE', // Type of action logged
                'subject_id' => $classSchedule->subject_id,
                'instructor_id' => $classSchedule->instructor_id,
                'room_id' => $classSchedule->room_id,
                'start_time' => $classSchedule->start_time,
                'end_time' => $classSchedule->end_time,
                'day_of_week' => $classSchedule->day_of_week,
                'max_students' => $classSchedule->max_students,
                'semester' => $classSchedule->semester,
                'created_at' => now(), // Timestamp for log entry
                'updated_at' => now(), // Timestamp for log update (if needed)
            ]);
        });

        // Log action when a class schedule is updated
        static::deleted(function ($classSchedule) {
            DB::table('class_schedule_logs')->insert([
                'performed_by' => Auth::user()->name ?? 'Admin', // The name of the user performing the action, defaults to 'Admin' if no user
                'action' => 'DELETE', // Type of action logged
                'subject_id' => $classSchedule->subject_id,
                'instructor_id' => $classSchedule->instructor_id,
                'room_id' => $classSchedule->room_id,
                'start_time' => $classSchedule->start_time,
                'end_time' => $classSchedule->end_time,
                'day_of_week' => $classSchedule->day_of_week,
                'max_students' => $classSchedule->max_students,
                'semester' => $classSchedule->semester,
                'created_at' => now(), // Timestamp for log entry
                'updated_at' => now(), // Timestamp for log update (if needed)
            ]);
        });
    }
}
