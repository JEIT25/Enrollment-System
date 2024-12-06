<?php

namespace App\Http\Controllers;

use App\Models\ClassSchedule;
use App\Models\Instructor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClassScheduleController extends Controller
{
    public function getAllAvailableSchedules(Request $request)
    {
        $roomId = $request->query('room_id');
        $instructorId = $request->query('instructor_id');
        $subjectId = $request->query('subject_id');

        if (!$instructorId || !$roomId || !$subjectId) {
            return response()->json(['error' => 'Invalid inputs'], 400);
        }

        // Fetch instructor's availability hours
        $instructor = Instructor::where('instructor_id', $instructorId)->first();
        if (!$instructor || !$instructor->availability_hours) {
            return response()->json(['error' => 'Instructor availability not found'], 404);
        }

        $availabilityHours = json_decode($instructor->availability_hours, true); // Decode availability_hours JSON

        $existingSchedules = ClassSchedule::where('room_id', $roomId)->get();

        $start = strtotime('07:30');
        $end = strtotime('19:30');
        $interval = 30 * 60; // 30 minutes

        $availableSlots = [];

        foreach ($availabilityHours as $day => $timeRanges) {
            foreach ($timeRanges as $timeRange) {
                [$rangeStart, $rangeEnd] = explode('-', $timeRange);
                $rangeStartTimestamp = strtotime($rangeStart);
                $rangeEndTimestamp = strtotime($rangeEnd);

                for ($time = max($start, $rangeStartTimestamp); $time < min($end, $rangeEndTimestamp); $time += $interval) {
                    $slotStart = date('H:i', $time);
                    $slotEnd = date('H:i', $time + $interval);

                    // Check for schedule conflicts
                    $conflict = $existingSchedules->first(
                        fn($schedule) =>
                        $schedule->day_of_week === $day &&
                        (($slotStart >= $schedule->start_time && $slotStart < $schedule->end_time) ||
                            ($slotEnd > $schedule->start_time && $slotEnd <= $schedule->end_time))
                    );

                    if (!$conflict) {
                        $availableSlots[$day][] = ['start_time' => $slotStart, 'end_time' => $slotEnd];
                    }
                }
            }
        }

        return response()->json($availableSlots);
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
        //get all instructors,rooms,subjects data
        $instructors = DB::table('instructors')->get();
        $rooms = DB::table('rooms')->get();
        $subjects = DB::table('subjects')->get();

        return view(
            'class-schedules.create',
            [
                'instructors' => $instructors,
                'rooms' => $rooms,
                'subjects' => $subjects
            ]
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

             // Validation
        try {
            $validatedData = $request->validate([
                'subject_id' => 'required|exists:subjects,subject_id',
                'instructor_id' => 'required|exists:instructors,instructor_id',
                'room_id' => 'required|exists:rooms,room_id',
                'start_time' => 'required|date_format:H:i',
                'end_time' => 'required|date_format:H:i|after:start_time',
                'day_of_week' => 'required|in:Monday,Tuesday,Wednesday,Thursday,Friday',
                'max_students' => 'required|integer|min:1',
                'semester' => 'required|in:First,Second,Summer',
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            // Validation failed, redirect back with errors
            return redirect()->back()->with('failed', $e->errors())->withInput();
        }

        $roomId = $request->room_id;
        $dayOfWeek = $request->day_of_week;
        $startTime = $request->start_time;
        $endTime = $request->end_time;

        // Check for schedule conflicts
        $conflict = DB::table('class_schedules')
            ->where('room_id', $roomId)
            ->where('day_of_week', $dayOfWeek)
            ->where(function ($query) use ($startTime, $endTime) {
                $query->whereBetween('start_time', [$startTime, $endTime])
                    ->orWhereBetween('end_time', [$startTime, $endTime])
                    ->orWhere(function ($query) use ($startTime, $endTime) {
                        $query->where('start_time', '<=', $startTime)
                            ->where('end_time', '>=', $endTime);
                    });
            })
            ->exists();

        if ($conflict) {
            // Return with a failure message (schedule conflict)
            return redirect()->back()->with('failed', 'Schedule conflict detected. Please adjust the times.');
        }

        // Create new schedule
        $schedule = new ClassSchedule([
            'subject_id' => $request->subject_id,
            'instructor_id' => $request->instructor_id,
            'room_id' => $request->room_id,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'day_of_week' => $request->day_of_week,
            'max_students' => $request->max_students,
            'semester' => $request->semester,
        ]);

        $schedule->save();

        // Return with a success message (schedule created successfully)
        return redirect()->back()->with('success', 'Class schedule created successfully.');
    }


    /**
     * Display the specified resource.
     */
    public function show(ClassSchedule $classSchedule)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ClassSchedule $classSchedule)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ClassSchedule $classSchedule)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ClassSchedule $classSchedule)
    {
        //
    }
}
