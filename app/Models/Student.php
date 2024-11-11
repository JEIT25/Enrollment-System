<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'student_id',
        'user_id',
        'type',
        'student_number',
        'first_name',
        'last_name',
        'email',
        'date_of_birth',
        'year_level',
        'enrollment_status',
        'date_enrolled',
        'financial_hold'
    ];
}
