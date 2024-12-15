@extends('layouts.app')

@section('main-content')
    <!-- Filter Form -->
    <form method="GET" action="{{ route('timetable') }}" class="filter-form">
        <div class="filter-container">
            <!-- Semester Filter -->
            <div class="filter-item">
                <label class="filter-label">Semester:</label>
                <label>
                    <input type="checkbox" name="semester" value="First"
                        {{ request('semester') == 'First' ? 'checked' : '' }}> First
                </label>
                <label>
                    <input type="checkbox" name="semester" value="Second"
                        {{ request('semester') == 'Second' ? 'checked' : '' }}> Second
                </label>
                <label>
                    <input type="checkbox" name="semester" value="Summer"
                        {{ request('semester') == 'Summer' ? 'checked' : '' }}> Summer
                </label>
            </div>

            <!-- Room Filter -->
            <div class="filter-item">
                <label for="room" class="filter-label">Room:</label>
                <select name="room" id="room" class="filter-select">
                    <option value="">-- Select Room --</option>
                    @foreach ($rooms as $r)
                        <option value="{{ $r->room_number }}" {{ request('room') == $r->room_number ? 'selected' : '' }}>
                            {{ $r->building_name }} - {{ $r->room_number }}
                        </option>
                    @endforeach
                </select>
            </div>

            <!-- Submit Button -->
            <div class="filter-item">
                <button type="submit" class="filter-button">Filter</button>
            </div>
        </div>
    </form>

    <!-- Timetable -->
    <div class="timetable-container">
        <table class="timetable">
            <thead>
                <tr>
                    <th>Time</th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($timetable['Monday'] as $timeSlot => $mondaySchedules)
                    <tr>
                        <td class="time-slot">
                            {{ \Carbon\Carbon::createFromFormat('H:i', explode(' - ', $timeSlot)[0])->format('g:i A') .
                                ' - ' .
                                \Carbon\Carbon::createFromFormat('H:i', explode(' - ', $timeSlot)[1])->format('g:i A') }}
                        </td>
                        @foreach (['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'] as $day)
                            <td class="schedule-cell">
                                @if (!empty($timetable[$day][$timeSlot]))
                                    @foreach ($timetable[$day][$timeSlot] as $schedule)
                                        <div class="schedule-item">
                                            <strong>{{ $schedule['subject_code'] }}</strong><br>
                                            <span>{{ $schedule['subject_name'] }}</span><br>
                                            <small>Room: {{ $schedule['room'] }}</small><br>
                                            <small>Instructor: {{ $schedule['instructor'] }}</small>
                                        </div>
                                    @endforeach
                                @else
                                    <div class="empty-cell">-</div>
                                @endif
                            </td>
                        @endforeach
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection

@section('styles')
    <style>
        /* General Styles */
        body {
            background-color: #f9fafb;
            color: #333;
            font-size: 14px;
        }

        main {
            padding-left: 15vw;
        }

        /* Filter Form */
        .filter-form {
            margin-bottom: 1.5rem;
            background-color: white;
            padding: 3rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .filter-container {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
        }

        .filter-item {
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
            font-size: 0.9rem;
        }

        .filter-label {
            font-weight: bold;
            margin-bottom: 0.25rem;
        }

        .filter-select {
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            font-size: 0.85rem;
        }

        .filter-button {
            background-color: #043b1b;
            /* Dark Green */
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background 0.3s;
            font-size: 0.85rem;
        }

        .filter-button:hover {
            background-color: #03281b;
            /* Darker green for hover effect */
        }

        /* Timetable Styles */
        .timetable-container {
            overflow-x: auto;
            margin-top: 1.5rem;
            font-size: 0.9rem;
            padding: 2rem;
        }

        .timetable {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .timetable th,
        .timetable td {
            border: 1px solid #ddd;
            padding: 0.75rem;
            text-align: center;
        }

        .timetable th {
            background-color: #043b1b;
            /* Dark Green for header */
            color: white;
            font-weight: bold;
        }

        .time-slot {
            background-color: #e5e7eb;
            font-weight: bold;
            color: #111827;
        }

        .schedule-cell {
            min-height: 3rem;
        }

        .schedule-item {
            background-color: #e0f2fe;
            color: #0369a1;
            padding: 0.25rem 0.5rem;
            margin: 0.25rem 0;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .schedule-item strong {
            font-size: 0.8rem;
            display: block;
            margin-bottom: 0.25rem;
        }

        .schedule-item small {
            font-size: 0.75rem;
            color: #555;
        }

        .empty-cell {
            color: #999;
            font-style: italic;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .filter-container {
                flex-direction: column;
                gap: 1rem;
            }

            .filter-item {
                width: 100%;
            }

            .timetable th,
            .timetable td {
                padding: 0.5rem;
            }

            .timetable {
                font-size: 0.8rem;
            }
        }
    </style>
@endsection
