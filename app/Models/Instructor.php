<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Instructor extends Model
{
    protected $fillable = [
        'instructor_id',
        'first_name',
        'last_name',
        'department_id',
        'email',
        'availability_hours',
    ];
}
