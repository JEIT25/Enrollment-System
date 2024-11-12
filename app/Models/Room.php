<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
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

    protected static function booted() //booted method in an Eloquent model is a special method used to define model event listeners
    {
        // Log insert actions
        static::created(function ($room) {
            DB::table('room_logs')->insert([
                'room_number' => $room->room_number,
                'building_name' => $room->building_name,
                'room_capacity' => $room->room_capacity,
                'room_type' => $room->room_type,
                'action' => 'INSERT',
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });

        // Log update actions
        static::updated(function ($room) {
            DB::table('room_logs')->insert([
                'room_number' => $room->room_number,
                'building_name' => $room->building_name,
                'room_capacity' => $room->room_capacity,
                'room_type' => $room->room_type,
                'action' => 'UPDATE',
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });


        // Log DELETE actions
        static::updated(function ($room) {
            DB::table('room_logs')->insert([
                'room_number' => $room->room_number,
                'building_name' => $room->building_name,
                'room_capacity' => $room->room_capacity,
                'room_type' => $room->room_type,
                'action' => 'DELETE',
                'performed_by' => Auth::user()->name ?? "Admin", // Authenticated user or defaults to Admin
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        });
    }
}