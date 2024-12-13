<?php

use App\Http\Controllers\ClassScheduleController;
use App\Http\Controllers\EnrollmentController;
use App\Http\Controllers\SubjectController;
use App\Models\Enrollment;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InstructorController;
use App\Http\Controllers\StudentController;

Route::get('/', function () {
    return view('landingPage.index');
})->name('landing-page');


//Class Schedule Routes
Route::get('/timetable', [ClassScheduleController::class, 'timetable'])->name('timetable');
Route::get('/class-schedules/get-available-schedules', [ClassScheduleController::class, 'getAllAvailableSchedules']);
Route::resource('class-schedules', ClassScheduleController::class)
    ->only('index', 'create', 'store', 'show', 'destroy');

//Enrollment routes
Route::get('/schedules/search', [EnrollmentController::class, 'searchSubjects']);
Route::get('/students/search', [EnrollmentController::class, 'searchStudents']);
Route::post('enrollments/check-conflicts', [EnrollmentController::class, 'checkScheduleConflicts']);
Route::resource('enrollments', EnrollmentController::class)->only('create', 'store');

//instructor routes
Route::resource('instructors', InstructorController::class)->only(['index', 'create', 'store','destroy']);

//subjects routes
Route::resource('subjects', SubjectController::class)->only(['index', 'create', 'destroy','store']);


Route::resource('students', StudentController::class);
