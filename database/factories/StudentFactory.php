<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
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
            'student_number' => fake()->numberBetween(2019, 2023) . '-' . fake()->unique()->numberBetween(1000, 9999), // Generate unique student number with the format 0000-0000
            'first_name' => $firstName, // Use first name for email and full name
            'last_name' => $lastName,   // Use last name for full name
            'email' => strtolower($firstName . '.' . $lastName . '@csucc.edu.ph'), // Generate email with csucc.edu.ph domain
            'date_of_birth' => fake()->dateTimeBetween('-25 years', '-19 years')->format('Y-m-d'), // Generate random dates between 1999-2004
            'year_level' => fake()->numberBetween(1, 4),
            'enrollment_status' => 'Active',
            'date_enrolled' => fake()->dateTimeBetween('2019-01-01', now())->format('Y-m-d'), // Generate random date enrolled from 2019 to the current year
        ];
    }

}
