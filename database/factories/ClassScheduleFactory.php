<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Subject;
use App\Models\Instructor;
use App\Models\Room;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ClassSchedule>
 */
class ClassScheduleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'subject_id' => Subject::factory(), // Subject model factory
            'instructor_id' => Instructor::factory(), // Instructor model factory
            'room_id' => Room::factory(), // Room model factory
            'start_time' => fake()->time('H:i:s', '07:00:00'), // Start time from 7:00 AM
            'end_time' => fake()->time('H:i:s', '19:30:00'), // End time up to 7:30 PM
            'day_of_week' => fake()->randomElement(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']),
            'max_students' => fake()->randomElement([25, 50]), // Number between 10 and 50
            'semester' => fake()->randomElement(['First', 'Second', 'Summer']),
        ];
    }
}
