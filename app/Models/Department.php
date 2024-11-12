<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class Department extends Model
{
    use HasFactory;
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'department_id',
        'department_name'
    ];

    protected static function booted()
    {
        // Log action when a department is created
        static::created(function ($department) {
            DB::table('department_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'INSERT', // action of action
                'department_name' => $department->department_name,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when a department is updated
        static::updated(function ($department) {
            DB::table('department_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'UPDATE', // action of action
                'department_name' => $department->department_name,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log action when a department is deleted
        static::deleted(function ($department) {
            DB::table('department_logs')->insert([
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'action' => 'DELETE', // type of action
                'department_name' => $department->department_name,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}
