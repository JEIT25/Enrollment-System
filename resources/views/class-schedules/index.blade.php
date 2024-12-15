@extends('layouts.app')

@section('page-title', 'Class Schedules')

@section('styles')
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        main {
            padding-bottom: 5rem;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
            color: #333;
        }

        /* Search Bar */
        .search-bar {
            margin-bottom: 20px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 50px;
        }

        .search-bar input {
            padding: 10px;
            font-size: 1rem;
            width: 50%;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* Button */
        .btn-create {
            padding: 10px 20px;
            font-size: 1rem;
            background-color: #043b1b;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s;
        }

        .btn-create:hover {
            background-color: #2d5a3c;
        }

        /* Schedule Grid */
        .schedule-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        /* Schedule Card */
        .schedule-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }

        .schedule-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        /* Text Styling */
        .schedule-card h3 {
            margin: 0;
            font-size: 1.5rem;
            color: #333;
        }

        .schedule-card p {
            margin: 5px 0;
            font-size: 1rem;
            color: #555;
        }

        .schedule-card .label {
            font-weight: bold;
            color: #333;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .schedule-card {
                padding: 10px;
            }

            .schedule-card h3 {
                font-size: 1.2rem;
            }

            .schedule-card p {
                font-size: 0.9rem;
            }
        }
    </style>
@endsection

@section('main-content')
    <div class="container">
        <h1>Class Schedules</h1>

        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search by subject, room, or instructor..." onkeyup="filterSchedules()">
            <a href="{{ route('class-schedules.create') }}" class="btn-create">New Schedule</a>
            <a href="{{route('timetable')}}" class="btn-create">Time Tables</a>
        </div>

        @if ($schedules->isEmpty())
            <p>No schedules available.</p>
        @else
            <div class="schedule-grid" id="scheduleGrid">
                @foreach ($schedules as $schedule)
                    <a href="{{ route('class-schedules.show', $schedule->schedule_id) }}" class="schedule-card"
                        data-subject="{{ $schedule->subject_name }} {{ $schedule->subject_code }}"
                        data-instructor="{{ $schedule->first_name }} {{ $schedule->last_name }}"
                        data-room="{{ $schedule->building_name }} {{ $schedule->room_number }}">
                        <h3>{{ $schedule->subject_name }} ({{ $schedule->subject_code }})</h3>
                        <p><span class="label">Day:</span> {{ $schedule->day_of_week }}</p>
                        <p><span class="label">Time:</span> {{ date('g:i A', strtotime($schedule->start_time)) }} - {{ date('g:i A', strtotime($schedule->end_time)) }}</p>
                        <p><span class="label">Semester:</span> {{ ucfirst($schedule->semester) }}</p>
                    </a>
                @endforeach
            </div>
        @endif
    </div>
@endsection

@section('scripts')
    <script>
        function filterSchedules() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const scheduleCards = document.querySelectorAll('.schedule-card');

            scheduleCards.forEach(card => {
                const subject = card.getAttribute('data-subject').toLowerCase();
                const instructor = card.getAttribute('data-instructor').toLowerCase();
                const room = card.getAttribute('data-room').toLowerCase();

                if (subject.includes(searchInput) || instructor.includes(searchInput) || room.includes(searchInput)) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
@endsection
