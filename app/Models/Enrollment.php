<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'enrollment_id',
        'student_id',
        'schedule_id',
        'date_enrolled',
        'grade',
        'status',
    ];
}
