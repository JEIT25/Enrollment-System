<?php

use App\Http\Controllers\ClassScheduleController;
use App\Http\Controllers\EnrollmentController;
use App\Http\Controllers\SubjectController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InstructorController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\AuthController;


//landing page
Route::get('/', function () {
    return view('landingPage.index');
})->name('landing-page');

//log routes
Route::get('login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->name('logout');

//dashboard
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard')
    ->middleware('auth');


//Class Schedule Routes
Route::get('/timetable', [ClassScheduleController::class, 'timetable'])->name('timetable')->middleware('auth');
Route::get('/class-schedules/get-available-schedules', [ClassScheduleController::class, 'getAllAvailableSchedules'])->middleware('auth');
Route::resource('class-schedules', ClassScheduleController::class)
    ->only('index', 'create', 'store', 'show', 'destroy')
    ->middleware('auth');


//Enrollment routes
Route::get('/schedules/search', [EnrollmentController::class, 'searchSubjects'])->middleware('auth');;
Route::get('/students/search', [EnrollmentController::class, 'searchStudents'])->middleware('auth');;
Route::post('enrollments/check-conflicts', [EnrollmentController::class, 'checkScheduleConflicts'])->middleware('auth');;
Route::resource('enrollments', EnrollmentController::class)->only('create', 'store')->middleware('auth');;

//instructor routes
Route::resource('instructors', InstructorController::class)->only(['index', 'create', 'store', 'destroy'])->middleware('auth');;

//subjects routes
Route::resource('subjects', SubjectController::class)->only(['index', 'create', 'destroy', 'store'])->middleware('auth');;


Route::resource('students', StudentController::class)->middleware('auth');;
