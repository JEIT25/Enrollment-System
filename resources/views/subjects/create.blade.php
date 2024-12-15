@extends('layouts.app')

@section('main-content')
    <div class="container">
        <h1>Add Subject</h1>
        <form action="{{ route('subjects.store') }}" method="POST">
            @csrf
            <div class="form-group">
                <label for="subject_code">Subject Code</label>
                <input type="text" id="subject_code" name="subject_code"
                       class="form-control @error('subject_code') is-invalid @enderror"
                       value="{{ old('subject_code') }}" required>
                @error('subject_code')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="subject_name">Subject Name</label>
                <input type="text" id="subject_name" name="subject_name"
                       class="form-control @error('subject_name') is-invalid @enderror"
                       value="{{ old('subject_name') }}" required>
                @error('subject_name')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="credits">Credits</label>
                <input type="number" id="credits" name="credits"
                       class="form-control @error('credits') is-invalid @enderror"
                       value="{{ old('credits') }}" required>
                @error('credits')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="department_id">Department</label>
                <select id="department_id" name="department_id"
                        class="form-control @error('department_id') is-invalid @enderror" required>
                    <option value="">Select a Department</option>
                    @foreach ($departments as $department)
                        <option value="{{ $department->department_id }}"
                                {{ old('department_id') == $department->department_id ? 'selected' : '' }}>
                            {{ $department->department_name }}
                        </option>
                    @endforeach
                </select>
                @error('department_id')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="weekly_hours">Weekly Hours</label>
                <input type="number" id="weekly_hours" name="weekly_hours"
                       class="form-control @error('weekly_hours') is-invalid @enderror"
                       value="{{ old('weekly_hours') }}">
                @error('weekly_hours')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-group">
                <label for="semester">Semester</label>
                <select id="semester" name="semester"
                        class="form-control @error('semester') is-invalid @enderror">
                    <option value="">Select Semester</option>
                    <option value="First" {{ old('semester') == 'First' ? 'selected' : '' }}>First</option>
                    <option value="Second" {{ old('semester') == 'Second' ? 'selected' : '' }}>Second</option>
                    <option value="Summer" {{ old('semester') == 'Summer' ? 'selected' : '' }}>Summer</option>
                </select>
                @error('semester')
                    <div class="text-danger mt-1">{{ $message }}</div>
                @enderror
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </form>
    </div>
@endsection

@section('styles')
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e4e8;
        }

        h1 {
            text-align: center;
            color: #333333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 14px;
            font-weight: 600;
            color: #555555;
            margin-bottom: 8px;
            display: inline-block;
        }

        .form-control {
            width: 100%;
            padding: 10px 14px;
            font-size: 14px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #043b1b;
            outline: none;
            background-color: #ffffff;
        }

        .is-invalid {
            border-color: #dc3545;
            background-color: #fff5f5;
        }

        .text-danger {
            font-size: 13px;
        }

        .btn {
            padding: 12px 20px;
            font-size: 14px;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-primary {
            background-color: #043b1b;
            color: #ffffff;
        }

        .btn-primary:hover {
            background-color: #065727;
        }

        .btn:active {
            transform: scale(0.98);
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }
    </style>
@endsection
