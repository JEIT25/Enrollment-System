<?php

use App\Http\Controllers\ClassScheduleController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('landingPage.index');
})->name('landing-page');


Route::get('/class-schedules/get-available-schedules', [ClassScheduleController::class, 'getAllAvailableSchedules']);

Route::resource('class-schedules', ClassScheduleController::class)
->only('create','store');
