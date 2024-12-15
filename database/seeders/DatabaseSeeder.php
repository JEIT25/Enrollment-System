<?php

namespace Database\Seeders;

use App\Models\ClassSchedule;
use App\Models\User;
use App\Models\Student;
use App\Models\Room;
use App\Models\Department;
use App\Models\Enrollment;
use App\Models\Instructor;
use App\Models\Subject;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'name' => "Admin Joseph Vistal",
            'email' => 'joseph.vistal@csucc.edu.ph',
        ]);

        // Student::factory(50)->create();
        // Room::factory(10)->create();
        // Department::factory()->create([
        //     'department_name' => 'College Of Engineering And Information Technology'
        // ]);
        // Department::factory()->create([
        //     'department_name' => 'College Of Business And Accountancy'
        // ]);
        // Department::factory()->create([
        //     'department_name' => 'College Of Tourism And Hospitality Management'
        // ]);
        // Department::factory()->create([
        //     'department_name' => 'College Of Industrial Technology And Teacher Education'
        // ]);

        // // Instructor::factory(10)->create();
        // Subject::factory(10)->create();
        // ClassSchedule::factory(10)->create();
        // Enrollment::factory(50)->create();
    }
}
