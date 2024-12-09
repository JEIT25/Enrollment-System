@extends('layouts.app')

@section('page-title', 'Class Schedule Details')

@section('styles')
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #000000;
            font-size: 2.5rem;
        }

        .schedule-details {
            display: flex;
            flex-direction: column;
            gap: 20px;
            text-transform: capitalize;
        }

        .detail {
            display: flex;
            justify-content: space-between;
            font-size: 1.15rem;
            padding: 12px;
            background-color: #f9f9f9;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .detail .label {
            font-weight: bold;
            color: #555;
        }

        .detail .value {
            color: #000000;
            font-weight: 600;
        }

        .button-container {
            text-align: center;
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 20px;
        }

        .btn {
            background-color: #043b1b;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 1.1rem;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: rgb(75, 141, 77);
        }

        .delete-btn {
            background-color: #da0000;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-size: 1.1rem;
            transition: background-color 0.3s ease;
        }

        .delete-btn:hover {
            background-color: #a71d1d;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .schedule-details {
                padding: 10px;
            }

            .detail {
                font-size: 1rem;
            }
        }
    </style>
@endsection

@section('main-content')
    <div class="container">
        <h1>Class Schedule Details</h1>

        <div class="schedule-details">
            <!-- Class Schedule Details -->
            <div class="detail">
                <span class="label">Subject & Code:</span>
                <span class="value">{{ $subject->subject_name }} - {{ $subject->subject_code }}</span>
            </div>

            <div class="detail">
                <span class="label">Instructor:</span>
                <span class="value">{{ $instructor->first_name }} {{ $instructor->last_name }}</span>
            </div>

            <div class="detail">
                <span class="label">Room:</span>
                <span class="value">{{ $room->building_name }} - {{ $room->room_number }}</span>
            </div>

            <div class="detail">
                <span class="label">Day:</span>
                <span class="value">{{ ucfirst($classSchedule->day_of_week) }}</span>
            </div>

            <div class="detail">
                <span class="label">Time:</span>
                <span class="value">{{ date('g:i A', strtotime($classSchedule->start_time)) }} -
                    {{ date('g:i A', strtotime($classSchedule->end_time)) }}</span>
            </div>

            <div class="detail">
                <span class="label">Max Students:</span>
                <span class="value">{{ $classSchedule->max_students }}</span>
            </div>

            <div class="detail">
                <span class="label">Semester:</span>
                <span class="value">{{ ucfirst($classSchedule->semester) }}</span>
            </div>
        </div>

        <div class="button-container">
            <a href="{{ route('class-schedules.index') }}" class="btn">Back to Schedule List</a>
            <form action="{{ route('class-schedules.destroy', $classSchedule->schedule_id) }}" method="POST"
                style="display: inline-block;">
                @csrf
                @method('DELETE')
                <button type="submit" class="delete-btn">Delete</button>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        document.querySelectorAll('form[method="POST"]').forEach(form => {
            form.addEventListener('submit', function(event) {
                const confirmDelete = confirm('Are you sure you want to delete this schedule?');
                if (!confirmDelete) {
                    event.preventDefault();
                }
            });
        });
    </script>
@endsection
