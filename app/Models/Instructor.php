<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Instructor extends Model
{
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'instructor_id',
        'first_name',
        'last_name',
        'department_id',
        'email',
        'availability_hours',
    ];
}
