<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Subject extends Model
{
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    use HasFactory;

    protected $primaryKey = 'subject_id'; 

    protected $fillable = [
        'subject_id',
        'subject_code',
        'subject_name',
        'credits',
        'department_id',
        'pre_requisite_subject_id',
        'co_requisite_subject_id',
        'weekly_hours',
        'semester'
    ];

    protected static function booted()
    {
        static::created(function ($subject) {
            DB::table('subject_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'INSERT',
                'subject_code' => $subject->subject_code,
                'subject_name' => $subject->subject_name,
                'credits' => $subject->credits,
                'department_id' => $subject->department_id,
                'pre_requisite_subject_id' => $subject->pre_requisite_subject_id,
                'co_requisite_subject_id' => $subject->co_requisite_subject_id,
                'weekly_hours' => $subject->weekly_hours,
                'semester' => $subject->semester,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        static::updated(function ($subject) {
            DB::table('subject_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'UPDATE',
                'subject_code' => $subject->subject_code,
                'subject_name' => $subject->subject_name,
                'credits' => $subject->credits,
                'department_id' => $subject->department_id,
                'pre_requisite_subject_id' => $subject->pre_requisite_subject_id,
                'co_requisite_subject_id' => $subject->co_requisite_subject_id,
                'weekly_hours' => $subject->weekly_hours,
                'semester' => $subject->semester,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        static::deleted(function ($subject) {
            DB::table('subject_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'DELETE',
                'subject_code' => $subject->subject_code,
                'subject_name' => $subject->subject_name,
                'credits' => $subject->credits,
                'department_id' => $subject->department_id,
                'pre_requisite_subject_id' => $subject->pre_requisite_subject_id,
                'co_requisite_subject_id' => $subject->co_requisite_subject_id,
                'weekly_hours' => $subject->weekly_hours,
                'semester' => $subject->semester,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}
