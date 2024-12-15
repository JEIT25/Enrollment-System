@extends('layouts.app')

@section('main-content')
<div class="container">
    <h1>Add Student</h1>
    <form action="{{ route('students.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="student_number">Student Number</label>
            <input type="text" id="student_number" name="student_number" required>
        </div>
        <div class="form-group">
            <label for="first_name">First Name</label>
            <input type="text" id="first_name" name="first_name" required>
        </div>
        <div class="form-group">
            <label for="last_name">Last Name</label>
            <input type="text" id="last_name" name="last_name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="date_of_birth">Date of Birth</label>
            <input type="date" id="date_of_birth" name="date_of_birth" required>
        </div>
<div class="form-group">
    <label for="year_level">Year Level</label>
    <select id="year_level" name="year_level" required>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
    </select>
</div>

        <div class="form-group">
            <label for="enrollment_status">Enrollment Status</label>
            <select id="enrollment_status" name="enrollment_status" required>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>
        <div class="form-group">
            <label for="date_enrolled">Date Enrolled</label>
            <input type="date" id="date_enrolled" name="date_enrolled">
        </div>
        <div class="form-group">
            <label for="financial_hold">Financial Hold</label>
            <select id="financial_hold" name="financial_hold" required>
                <option value="0">No</option>
                <option value="1">Yes</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Add Student</button>
    </form>
</div>
@endsection

@section('styles')
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 50px auto;
        padding: 20px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-size: 14px;
        color: #555;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"],
    input[type="date"],
    input[type="number"],
    select {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input:focus,
    select:focus {
        border-color: #043b1b;
        outline: none;
        background-color: #f9f9ff;
    }

    button {
        display: inline-block;
        width: 100%;
        padding: 10px 15px;
        background: #043b1b;
        color: #fff;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background: #065727;
    }

    button:active {
        transform: scale(0.98);
    }

    @media (max-width: 768px) {
        .container {
            margin: 20px;
            padding: 15px;
        }

        h1 {
            font-size: 20px;
        }

        button {
            font-size: 14px;
        }
    }
</style>
@endsection
