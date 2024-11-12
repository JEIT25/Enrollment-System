<?php

namespace Database\Factories;

use App\Models\ClassSchedule;
use App\Models\Student;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Enrollment>
 */
class EnrollmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'student_id' => Student::factory(),
            'schedule_id' => ClassSchedule::factory(),
            'date_enrolled' => fake()->dateTimeBetween('-3 years', 'now')->format('Y-m-d'),
            'grade' => 0,
            'status' => 'Enrolled',
        ];
    }
}
