<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Room>
 */
class RoomFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $buildingName = fake()->randomElement(['Acad', 'Comlab']); //random bulding name between acad and comlab
        return [
            'room_number' => fake()->unique()->numberBetween(100,305),
            'building_name' => $buildingName,
            'room_capacity' => $buildingName == 'Acad' ? 50 : 25, //set to 50 if Acad, else (comlab) set to 25
            'room_type' => $buildingName == 'Acad' ? 'Lecture' : 'Laboratory', //if acad set to lecture, else(comlab)  set to laboratory
        ];
    }
}
