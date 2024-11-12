<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Subject>
 */
class SubjectFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'subject_code' => strtoupper(fake()->bothify('??###')), // Generates a code like AB123
            'subject_name' => fake()->words(3, true), // Generates a random subject name, e.g., "Advanced Math Studies"
            'credits' => fake()->numberBetween(2, 3), // Generates random credits between 1 and 5
            'department_id' => fake()->numberBetween(1, 4), // Assumes department IDs range from 1 to 10
            'weekly_hours' => fake()->randomElement([2, 5]), // Generates random weekly hours between 1 and 10
            'semester' => fake()->randomElement(['First', 'Second', 'Summer']), // Randomly selects the semester
        ];
    }
}
