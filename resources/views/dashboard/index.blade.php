@extends('layouts.app')

@section('main-content')
    <div class="dashboard-container">
        <div class="welcome-text">
            <marquee>Welcome to the system dashboard, Admin {{Auth::user()->name}}</marquee>
        </div>

        <div class="stats-container">
            <a href="{{ route('students.index') }}" class="stat-box">
                <h3>Students</h3>
                <p>{{ $studentsCount }}</p>
            </a>

            <a href="{{ route('class-schedules.index') }}" class="stat-box">
                <h3>Class Schedules</h3>
                <p>{{ $classSchedulesCount }}</p>
            </a>

            <a href="{{ route('subjects.index') }}" class="stat-box">
                <h3>Subjects</h3>
                <p>{{ $subjectsCount }}</p>
            </a>

            <a href="{{ route('instructors.index') }}" class="stat-box">
                <h3>Instructors</h3>
                <p>{{ $instructorsCount }}</p>
            </a>

            <a href="{{ route('enrollments.create') }}" class="stat-box">
                <h3>Enrollments</h3>
                <p>{{ $enrollmentsCount }}</p>
            </a>
        </div>
    </div>
@endsection

@section('styles')
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Welcome Text */
        .welcome-text {
            text-align: center;
            margin-bottom: 2rem;
        }

        marquee {
            font-size: 1.5rem;
            color: #043b1b;
            font-weight: bold;
        }

        /* Stats Container */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 columns */
            gap: 2rem;
        }

        /* Stat Box */
        .stat-box {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            text-decoration: none; /* Remove underline */
            color: inherit; /* Inherit the color */
        }

        .stat-box:hover {
            background-color: #043b1b;
            color: white;
            transform: scale(1.05);
        }

        .stat-box h3 {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .stat-box p {
            font-size: 2rem;
            font-weight: bold;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .stats-container {
                grid-template-columns: 1fr; /* 1 column on smaller screens */
            }

            .stat-box {
                width: 100%;
            }
        }
    </style>
@endsection
