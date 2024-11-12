<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Instructor>
 */
class InstructorFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $firstName = fake()->firstName();
        $lastName = fake()->lastName();
        return [
            'first_name' => $firstName,
            'last_name' => $lastName,
            'department_id' => fake()->numberBetween(1, 4),
            'email' => strtolower($firstName . '.' . $lastName . '@csucc.edu.ph'), // Generate email with csucc.edu.ph domain
            'availability_hours' => json_encode([
                'Monday' => ['09:00-12:00', '14:00-17:00'],
                'Wednesday' => ['10:00-13:00'],
                'Friday' => ['09:00-11:00', '13:00-15:00'],
            ]),
        ];
    }
}
