<?php

namespace App\Http\Controllers;
use App\Models\Student;
use App\Models\ClassSchedule;
use App\Models\Subject;
use App\Models\Instructor;
use App\Models\Enrollment;
use Illuminate\Http\Request;
class DashboardController extends Controller
{
    public function index()
    {
        $studentsCount = Student::count();
        $classSchedulesCount = ClassSchedule::count();
        $subjectsCount = Subject::count();
        $instructorsCount = Instructor::count();
        $enrollmentsCount = Enrollment::count();

        return view('dashboard.index', compact(
            'studentsCount',
            'classSchedulesCount',
            'subjectsCount',
            'instructorsCount',
            'enrollmentsCount'
        ));
    }
}
