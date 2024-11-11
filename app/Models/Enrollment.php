<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
    protected $fillable = [
        'enrollment_id',
        'student_id',
        'schedule_id',
        'date_enrolled',
        'grade',
        'status',
    ];
}
