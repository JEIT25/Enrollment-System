<?php

namespace App\Http\Controllers;

use App\Models\ClassSchedule;
use App\Models\Instructor;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Subject;
use App\Models\Student;

class ClassScheduleController extends Controller
{
    public function timetable(Request $request)
    {
        // Fetch filters from the request
        $semester = $request->input('semester');
        $room = $request->input('room');
        $subject = $request->input('subject');
        $instructor = $request->input('instructor');

        // Fetch all unique rooms for dropdown
        $rooms = DB::table('rooms')
            ->select('room_id', 'building_name', 'room_number')
            ->distinct()
            ->get();

        // Start query to retrieve timetable data
        $query = DB::table('class_schedules')
            ->leftJoin('subjects', 'class_schedules.subject_id', '=', 'subjects.subject_id')
            ->leftJoin('instructors', 'class_schedules.instructor_id', '=', 'instructors.instructor_id')
            ->leftJoin('rooms', 'rooms.room_id', '=', 'class_schedules.room_id')
            ->select(
                'class_schedules.day_of_week',
                'class_schedules.start_time',
                'class_schedules.end_time',
                'subjects.subject_code',
                'subjects.subject_name',
                'rooms.building_name as room_building',
                'rooms.room_number',
                'instructors.first_name AS instructor_first_name',
                'instructors.last_name AS instructor_last_name'
            );

        // Apply filters
        if ($semester) {
            $query->where('class_schedules.semester', $semester);
        }

        if ($room) {
            $query->where('rooms.room_number', $room);
        }

        if ($subject) {
            $query->where('subjects.subject_name', 'like', '%' . $subject . '%');
        }

        if ($instructor) {
            $query->where(DB::raw("CONCAT(instructors.first_name, ' ', instructors.last_name)"), 'like', '%' . $instructor . '%');
        }

        // Retrieve filtered schedules
        $schedules = $query->get();


        // Process data into timetable format
        $timetable = $this->formatTimetable($schedules);


        // Return view with the data
        return view('timetable.index', compact('timetable', 'semester', 'room', 'subject', 'instructor', 'rooms'));
    }
    private function formatTimetable($schedules)
    {
        $timetable = [];

        // Define the range of times: 7:00 AM to 7:30 PM
        $startHour = 7;
        $endHour = 19; // 7:00 PM
        $timeSlots = [];

        // Generate all time slots from 7:00 AM to 7:30 PM in 30-minute intervals
        for ($hour = $startHour; $hour <= $endHour; $hour++) {
            $formattedHour = str_pad($hour, 2, '0', STR_PAD_LEFT);
            $nextHour = str_pad($hour + 1, 2, '0', STR_PAD_LEFT);

            // Add 30-minute intervals for each hour (e.g., 7:00 - 7:30, 7:30 - 8:00, ...)
            $timeSlots[] = "{$formattedHour}:00 - {$formattedHour}:30";
            if ($hour < $endHour) {
                $timeSlots[] = "{$formattedHour}:30 - {$nextHour}:00";
            }
        }

        // Initialize timetable structure for each day with time slots
        foreach (['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'] as $day) {
            $timetable[$day] = array_fill_keys($timeSlots, []); // Initialize all slots as empty arrays
        }

        // Populate timetable with schedule data
        foreach ($schedules as $schedule) {
            $day = $schedule->day_of_week;

            // Convert start_time and end_time to 'H:i'
            $startTime = strtotime($schedule->start_time);
            $endTime = strtotime($schedule->end_time);

            // Ensure time slots are dynamically populated based on actual schedule start and end time
            $currentTime = $startTime;

            // Loop through time slots based on the start and end time of the schedule
            while ($currentTime < $endTime) {
                $startFormatted = date('H:i', $currentTime);
                $nextTime = strtotime('+30 minutes', $currentTime); // Increment by 30 minutes
                $endFormatted = date('H:i', $nextTime);

                $timeSlot = "{$startFormatted} - {$endFormatted}";

                // Ensure time slot exists in timetable and populate with schedule data
                if (isset($timetable[$day][$timeSlot])) {
                    $timetable[$day][$timeSlot][] = [
                        'subject_code' => $schedule->subject_code,
                        'subject_name' => $schedule->subject_name,
                        'room' => "{$schedule->room_building} - {$schedule->room_number}",
                        'instructor' => "{$schedule->instructor_first_name} {$schedule->instructor_last_name}",
                    ];
                }

                // Move to the next time slot
                $currentTime = $nextTime;
            }
        }

        return $timetable;
    }






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

        $availabilityHours = json_decode($instructor->availability_hours, true); // Decode availability_hours type JSON

        $existingSchedules = ClassSchedule::where('room_id', $roomId)->get();

        $start = strtotime('07:00');
        $end = strtotime('19:30');
        $interval = 30 * 60; // 30 minutes

        $availableSlots = [];

        foreach ($availabilityHours as $day => $timeRanges) { //loop splits each key-value pair of the $availabilityHours array into two variables
            foreach ($timeRanges as $timeRange) {
                [$rangeStart, $rangeEnd] = explode('-', $timeRange); //using array destructuring in PHP to assign values from the result of the explode() function to variables
                $rangeStartTimestamp = strtotime($rangeStart); //convert string start range to type time
                $rangeEndTimestamp = strtotime($rangeEnd); //convert string end range to type time

                for ($time = max($start, $rangeStartTimestamp); $time < min($end, $rangeEndTimestamp); $time += $interval) {
                    $slotStart = date('H:i', $time);
                    $slotEnd = date('H:i', $time + $interval);

                    // Check for schedule conflicts
                    $conflict = $existingSchedules->first(function ($schedule) use ($day, $slotStart, $slotEnd) {
                        // Check if the schedule day matches the current day
                        if ($schedule->day_of_week === $day) {
                            // Check if the slot overlaps with the existing schedule
                            $startOverlap = $slotStart >= $schedule->start_time && $slotStart < $schedule->end_time;
                            $endOverlap = $slotEnd > $schedule->start_time && $slotEnd <= $schedule->end_time;

                            if ($startOverlap || $endOverlap) {
                                return true; // There is a conflict
                            }
                        }
                        return false; // No conflict
                    });


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
        // Fetch class schedules with related data using the DB facade
        $schedules = DB::table('class_schedules')
            ->join('subjects', 'class_schedules.subject_id', '=', 'subjects.subject_id')
            ->join('instructors', 'class_schedules.instructor_id', '=', 'instructors.instructor_id')
            ->join('rooms', 'class_schedules.room_id', '=', 'rooms.room_id')
            ->select(
                'class_schedules.*', // Select all columns from class_schedules
                'subjects.*', // Select all columns from subjects
                'instructors.*', // Select all columns from instructors
                'rooms.*' // Select all columns from rooms
            )
            ->get();

        return view('class-schedules.index', compact('schedules'));
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
    public function show($id)
    {
        // Fetch the class schedule by its ID
        $classSchedule = DB::table('class_schedules')
            ->where('schedule_id', $id)
            ->first(); // Get the class schedule data

        if (!$classSchedule) {
            abort(404); // If no class schedule is found, show a 404 error
        }

        // Fetch the related subject, instructor, and room using joins
        $subject = DB::table('subjects')
            ->where('subject_id', $classSchedule->subject_id)
            ->first();

        $instructor = DB::table('instructors')
            ->where('instructor_id', $classSchedule->instructor_id)
            ->first();

        $room = DB::table('rooms')
            ->where('room_id', $classSchedule->room_id)
            ->first();

        // Return the view with the class schedule and its related data
        return view('class-schedules.show', compact('classSchedule', 'subject', 'instructor', 'room'));
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
    public function destroy($id)
    {
        // Retrieve the ClassSchedule by its schedule_id
        $classSchedule = ClassSchedule::where('schedule_id', $id)->first();

        if (!$classSchedule) {
            // If no record is found, you can handle it as needed (e.g., return an error)
            return redirect()->route('class-schedules.index')
                ->with('error', 'Class schedule not found.');
        }

        // Delete the ClassSchedule
        $classSchedule->delete();

        // Return with a success message (class schedule deleted successfully)
        return redirect()->route('class-schedules.index')
            ->with('success', 'Class schedule deleted successfully.');
    }


}
