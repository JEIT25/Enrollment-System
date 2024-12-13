<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SubjectController extends Controller
{
    // Display a list of all subjects
    public function index()
    {
        $subjects = DB::table('subjects')->get(); // Fetch all subjects without Eloquent
        return view('subjects.index', compact('subjects'));
    }

    // Show the form to create a new subject
    public function create()
    {
        $departments = DB::table('departments')->get(); // Fetch departments
        return view('subjects.create', compact('departments'));
    }

    /**
     * Store a newly created resource in storage.
     */
    // Store a new subject
    public function store(Request $request)
    {
        // Validate input
        $validated = $request->validate([
            'subject_code' => 'required|string|max:10|unique:subjects,subject_code',
            'subject_name' => 'required|string|max:255',
            'credits' => 'required|integer|min:1',
            'department_id' => 'required|integer|exists:departments,department_id',
            'weekly_hours' => 'nullable|integer|min:0',
            'semester' => 'nullable|string|max:20',
        ]);

        // Insert into database
        DB::table('subjects')->insert([
            'subject_code' => $validated['subject_code'],
            'subject_name' => $validated['subject_name'],
            'credits' => $validated['credits'],
            'department_id' => $validated['department_id'],
            'weekly_hours' => $validated['weekly_hours'],
            'semester' => $validated['semester'],
        ]);

        return redirect()->route('subjects.index')->with('success', 'Subject added successfully!');
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

    // Delete a specific subject
    public function destroy($id)
    {
        DB::table('subjects')->where('subject_id', $id)->delete(); // Delete the subject
        return redirect()->route('subjects.index')->with('success', 'Subject deleted successfully!');
    }
}
