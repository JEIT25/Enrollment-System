<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Instructor extends Model
{
    use HasFactory;

    protected $primaryKey = 'instructor_id'; // If the primary key is not 'id'

    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'instructor_id',
        'first_name',
        'last_name',
        'department_id',
        'email',
        'availability_hours',
    ];

    protected static function booted()
    {
        // Log action when an instructor is created
        static::created(function ($instructor) {
            DB::table('instructor_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'INSERT', // action
                'first_name' => $instructor->first_name,
                'last_name' => $instructor->last_name,
                'email' => $instructor->email,
                'department_id' => $instructor->department_id,
                'availability_hours' => $instructor->availability_hours,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when an instructor is updated
        static::updated(function ($instructor) {
            DB::table('instructor_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'UPDATE', // action
                'first_name' => $instructor->first_name,
                'last_name' => $instructor->last_name,
                'email' => $instructor->email,
                'department_id' => $instructor->department_id,
                'availability_hours' => $instructor->availability_hours,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when an instructor is deleted
        static::deleted(function ($instructor) {
            DB::table('instructor_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'DELETE', // action
                'first_name' => $instructor->first_name,
                'last_name' => $instructor->last_name,
                'email' => $instructor->email,
                'department_id' => $instructor->department_id,
                'availability_hours' => $instructor->availability_hours,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}
