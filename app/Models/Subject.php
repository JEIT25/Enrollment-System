<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    use HasFactory;
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
}
