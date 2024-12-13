@extends('layouts.app')

@section('content')
<div class="container">
    <h1 class="text-center text-2xl font-bold mb-5">Class Schedule</h1>

    {{-- Filter Form --}}
    <form method="GET" action="{{ route('timetable') }}" class="mb-5 grid grid-cols-2 gap-4 md:grid-cols-4">
        {{-- Semester Filter --}}
        <div>
            <label for="semester" class="block font-medium mb-2">Semester</label>
            <select name="semester" id="semester" class="form-select">
                <option value="" selected>All</option>
                <option value="1st" {{ request('semester') == '1st' ? 'selected' : '' }}>1st Semester</option>
                <option value="2nd" {{ request('semester') == '2nd' ? 'selected' : '' }}>2nd Semester</option>
                <option value="Summer" {{ request('semester') == 'Summer' ? 'selected' : '' }}>Summer</option>
            </select>
        </div>

        {{-- Subject Filter --}}
        <div>
            <label for="subject" class="block font-medium mb-2">Subject</label>
            <input
                type="text"
                name="subject"
                id="subject"
                value="{{ request('subject') }}"
                placeholder="Subject Name"
                class="form-input"
            >
        </div>

        {{-- Student Filter --}}
        <div>
            <label for="student" class="block font-medium mb-2">Student</label>
            <input
                type="text"
                name="student"
                id="student"
                value="{{ request('student') }}"
                placeholder="Student Name/ID"
                class="form-input"
            >
        </div>

        {{-- Instructor Filter --}}
        <div>
            <label for="instructor" class="block font-medium mb-2">Instructor</label>
            <input
                type="text"
                name="instructor"
                id="instructor"
                value="{{ request('instructor') }}"
                placeholder="Instructor Name"
                class="form-input"
            >
        </div>

        {{-- Submit Button --}}
        <div class="col-span-2 md:col-span-4 text-right">
            <button type="submit" class="btn btn-primary">Filter</button>
        </div>
    </form>

    {{-- Timetable Table --}}
    <div class="overflow-x-auto">
        <table class="table-auto w-full border-collapse border border-gray-300 text-sm">
            {{-- Table Header --}}
            <thead>
                <tr>
                    <th class="border border-gray-300 p-2">Time</th>
                    @foreach (array_keys($timetable) as $day)
                        <th class="border border-gray-300 p-2">{{ $day }}</th>
                    @endforeach
                </tr>
            </thead>

            {{-- Table Body --}}
            <tbody>
                @foreach (array_keys(reset($timetable)) as $timeSlot)
                    <tr>
                        {{-- Time Slot --}}
                        <td class="border border-gray-300 p-2">{{ $timeSlot }}</td>

                        {{-- Day Columns --}}
                        @foreach ($timetable as $day => $slots)
                            <td class="border border-gray-300 p-2 text-center">
                                @if (isset($slots[$timeSlot]))
                                    <div class="font-medium">{{ $slots[$timeSlot]['subject'] }}</div>
                                    <div class="text-sm text-gray-600">Room: {{ $slots[$timeSlot]['room'] }}</div>
                                    <div class="text-sm text-gray-500">Instructor: {{ $slots[$timeSlot]['instructor'] }}</div>
                                @else
                                    <span class="text-gray-400">---</span>
                                @endif
                            </td>
                        @endforeach
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
