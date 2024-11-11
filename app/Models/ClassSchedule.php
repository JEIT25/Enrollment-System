<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ClassSchedule extends Model
{
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
}
