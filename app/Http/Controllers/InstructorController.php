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

        // dd($request->all());
        // Validate the incoming request
        $validated = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'department_id' => 'required|integer|exists:departments,department_id',
            'email' => 'required|email|max:255|unique:instructors,email',
            'availability_hours' => 'required|json', // Validate the JSON format
        ]);

        // Decode the JSON availability data
        $availability = json_decode($validated['availability_hours'], true);

        // Validate the structure of the decoded availability array
        foreach ($availability as $day => $slots) {
            if (!is_array($slots)) {
                return redirect()->back()->withErrors([
                    'availability_hours' => 'The availability data must be properly structured.',
                ]);
            }

            foreach ($slots as $slot) {
                if (!preg_match('/^([0-1][0-9]|2[0-3]):[0-5][0-9]-([0-1][0-9]|2[0-3]):[0-5][0-9]$/', $slot)) {
                    return redirect()->back()->withErrors([
                        'availability_hours' => "Invalid time slot format: {$slot} for {$day}. Time must follow the format HH:MM-HH:MM.",
                    ]);
                }
            }
        }

        // Create the instructor
        Instructor::create([
            'first_name' => $validated['first_name'],
            'last_name' => $validated['last_name'],
            'department_id' => $validated['department_id'],
            'email' => $validated['email'],
            'availability_hours' => json_encode($availability), // Store as JSON in the database
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
    public function destroy($id)
    {
        // Find the instructor by ID and soft delete it
        $instructor = Instructor::findOrFail($id);
        $instructor->delete();

        return redirect()->route('instructors.index')->with('success', 'Instructor deleted successfully!');
    }

}
