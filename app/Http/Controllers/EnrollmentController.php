<?php

namespace App\Http\Controllers;

use App\Models\ClassSchedule;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EnrollmentController extends Controller
{
    public function searchSubjects(Request $request)
    {
        $query = $request->get('query', '');
        $day = $request->get('day', '');

        $schedules = ClassSchedule::query()
            ->join('instructors', 'instructors.instructor_id', '=', 'class_schedules.instructor_id')
            ->join('subjects', 'subjects.subject_id', '=', 'class_schedules.subject_id')
            ->select('subjects.*', 'class_schedules.*', 'instructors.*')
            ->when($query, fn($q) => $q->where('subject_name', 'like', "%{$query}%")
                ->orWhere('subject_code', 'like', "%{$query}%"))
            ->when($day, fn($q) => $q->where('day_of_week', $day))
            ->get();

        return response()->json($schedules);
    }


    public function searchStudents(Request $request)
    {
        $query = $request->input('query');
        $yearLevel = $request->input('year_level');

        $students = Student::query()
            ->when($query, function ($q) use ($query) {
                $q->where('first_name', 'like', "%$query%")
                    ->orWhere('last_name', 'like', "%$query%")
                    ->orWhere('email', 'like', "%$query%")
                    ->orWhere('student_number', 'like', "%$query%");
            })
            ->when($yearLevel, function ($q) use ($yearLevel) {
                $q->where('year_level', $yearLevel);
            })
            ->get();

        return response()->json($students);
    }


    public function checkScheduleConflicts(Request $request)
    {
        $studentId = $request->input('student_id');
        $scheduleId = $request->input('schedule_id');

        // Fetch the schedule details for the given schedule ID
        $newSchedule = DB::table('class_schedules')->where('schedule_id', $scheduleId)->first();

        if (!$newSchedule) {
            return response()->json(['error' => 'Invalid schedule ID'], 400);
        }

        // Fetch the student's currently enrolled schedules
        $studentSchedules = DB::table('enrollments')
            ->join('class_schedules', 'enrollments.schedule_id', '=', 'class_schedules.schedule_id')
            ->where('enrollments.student_id', $studentId)
            ->select('class_schedules.start_time', 'class_schedules.end_time', 'class_schedules.day_of_week')
            ->get();

        // Check for time conflicts
        foreach ($studentSchedules as $schedule) {
            if ($schedule->day_of_week === $newSchedule->day_of_week) {
                $newStart = strtotime($newSchedule->start_time);
                $newEnd = strtotime($newSchedule->end_time);
                $currentStart = strtotime($schedule->start_time);
                $currentEnd = strtotime($schedule->end_time);

                if (
                    ($newStart < $currentEnd && $newStart >= $currentStart) || // Overlaps start
                    ($newEnd > $currentStart && $newEnd <= $currentEnd) || // Overlaps end
                    ($newStart <= $currentStart && $newEnd >= $currentEnd) // Encloses existing
                ) {
                    return response()->json(['conflict' => true, 'message' => 'Schedule conflict detected.'], 409);
                }
            }
        }

        return response()->json(['conflict' => false, 'message' => 'No conflicts found.'], 200);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $students = DB::table('students')->get();
        $schedules = DB::table('class_schedules')
        ->join('instructors','instructors.instructor_id','=','class_schedules.instructor_id')
        ->join('subjects','subjects.subject_id', '=','class_schedules.subject_id')
        ->select('subjects.*','class_schedules.*', 'instructors.*')
        ->get();

        return view('enrollments.create', compact('students', 'schedules'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $studentId = $request->input('student_id');
        $scheduleIds = $request->input('schedule_id'); // Expecting an array of schedule IDs

        if (!is_array($scheduleIds) || empty($scheduleIds)) {
            return response()->json(['error' => 'Invalid or empty schedule data provided.'], 422);
        }

        $enrolledSchedules = [];
        $conflicts = [];

        foreach ($scheduleIds as $scheduleId) {
            // Set up the request to check for conflicts
            $request->merge(['schedule_id' => $scheduleId]);

            $conflictCheck = $this->checkScheduleConflicts($request);

            if ($conflictCheck->getData()->conflict) {
                // Track conflicts for feedback
                $conflicts[] = $scheduleId;
                continue;
            }

            // Enroll the student using Eloquent's create method
            $enrollment = \App\Models\Enrollment::create([
                'student_id' => $studentId,
                'schedule_id' => $scheduleId,
                'date_enrolled' => now(),
            ]);

            $enrolledSchedules[] = $enrollment;
        }

        if (!empty($conflicts)) {
            return response()->json([
                'error' => 'Some schedules could not be enrolled due to conflicts.',
                'conflicted_schedule_ids' => $conflicts,
                'successfully_enrolled' => $enrolledSchedules,
            ], 409);
        }

        return response()->json([
            'success' => true,
            'message' => 'Student enrolled successfully in all schedules.',
            'enrolled_schedules' => $enrolledSchedules,
        ], 201);
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
