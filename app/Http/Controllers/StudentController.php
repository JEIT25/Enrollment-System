<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentController extends Controller
{
    public function index()
    {
        // Fetch all students from the database
        $students = DB::table('students')->get();

        return view('students.index', compact('students'));
    }

    public function create()
    {
        return view('students.create');
    }

    public function store(Request $request)
    {
        // Validate and insert student data
        $validated = $request->validate([
            'student_number' => 'required|unique:students,student_number',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|email|max:255|unique:students,email',
            'date_of_birth' => 'required|date',
            'year_level' => 'required|integer|min:1|max:8',
            'enrollment_status' => 'required|string|in:active,inactive',
            'date_enrolled' => 'nullable|date',
            'financial_hold' => 'required|boolean',
        ]);

        DB::table('students')->insert($validated);

        return redirect()->route('students.index')->with('success', 'Student added successfully!');
    }

    public function destroy($id)
    {
        // Delete a student using a raw query
        DB::table('students')->where('student_id', $id)->delete();

        return redirect()->route('students.index')->with('success', 'Student deleted successfully!');
    }
    /**
     * Display the specified resource.
     */
    public function show(Student $student)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Student $student)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Student $student)
    {
        //
    }
}
