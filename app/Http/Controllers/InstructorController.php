<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\Instructor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InstructorController extends Controller
{
    // Display a listing of the instructors
    public function index()
    {
        $instructors = DB::table('instructors')
            ->join('departments', 'instructors.department_id', '=', 'departments.department_id')
            ->select(
                'instructors.instructor_id',
                'instructors.first_name',
                'instructors.last_name',
                'instructors.email',
                'instructors.availability_hours',
                'departments.department_name'
            )
            ->get();

        return view('instructors.index', compact('instructors'));    }

    // Show the form for creating a new instructor
    public function create()
    {
        $departments = Department::all(); // Fetch departments for the dropdown
        return view('instructors.create', compact('departments'));
    }

    // Store a new instructor
    public function store(Request $request)
    {
        // Validation Rules
        $validated = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'department_id' => 'required|exists:departments,department_id',
            'email' => 'required|email|unique:instructors,email',
            'availability_hours' => 'required|array',
        ]);

        // Format Availability Hours to JSON
        $availabilityHours = [];
        foreach ($validated['availability_hours'] as $day => $slots) {
            if (!empty($slots)) {
                $availabilityHours[$day] = $slots;
            }
        }

        // Insert into database
        DB::table('instructors')->insert([
            'first_name' => $validated['first_name'],
            'last_name' => $validated['last_name'],
            'department_id' => $validated['department_id'],
            'email' => $validated['email'],
            'availability_hours' => json_encode($availabilityHours), // Store as JSON
        ]);

        return redirect()->route('instructors.index')->with('success', 'Instructor added successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
