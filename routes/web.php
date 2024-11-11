<?php

use App\Http\Controllers\ClassScheduleController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('landingPage.index');
})->name('landing-page');


Route::resource('class_schedule', ClassScheduleController::class)
->only('create');