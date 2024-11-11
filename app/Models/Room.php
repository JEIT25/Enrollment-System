<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Room extends Model
{
    use HasFactory;
    public $timestamps = false;//no timestamps for this model, not in migration, needed to avoid error in db seeding
    protected $fillable = [
        'room_id',
        'room_number',
        'building_name',
        'room_capacity',
        'room_type'
    ];
}
