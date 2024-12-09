@extends('layouts.app')

@section('main-content')
<div class="container">
    <h1>Add Instructor</h1>

    <!-- Display Validation Errors -->
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('instructors.store') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="first_name">First Name</label>
            <input
                type="text"
                name="first_name"
                class="form-control"
                value="{{ old('first_name') }}"
                required>
        </div>

        <div class="form-group">
            <label for="last_name">Last Name</label>
            <input
                type="text"
                name="last_name"
                class="form-control"
                value="{{ old('last_name') }}"
                required>
        </div>

        <div class="form-group">
            <label for="department_id">Department</label>
            <select name="department_id" class="form-control" required>
                <option value="">Select a department</option>
                @foreach($departments as $department)
                <option value="{{ $department->department_id }}"
                        {{ old('department_id') == $department->department_id ? 'selected' : '' }}>
                    {{ $department->department_name }}
                </option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input
                type="email"
                name="email"
                class="form-control"
                value="{{ old('email') }}"
                required>
        </div>

        <div class="form-group">
            <label>Availability Hours (Per Day)</label>
            @php
                $days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
                $timeSlots = [];
                for ($hour = 7; $hour <= 19; $hour++) {
                    $timeSlots[] = sprintf("%02d:00", $hour);
                    $timeSlots[] = sprintf("%02d:30", $hour);
                }
            @endphp

            @foreach($days as $day)
            <div class="mb-3">
                <label>{{ $day }}</label>
                <select name="availability_hours[{{ $day }}][]" class="form-control" multiple>
                    @foreach($timeSlots as $slot)
                        <option value="{{ $slot }}">{{ date('h:i A', strtotime($slot)) }} - {{ date('h:i A', strtotime('+30 minutes', strtotime($slot))) }}</option>
                    @endforeach
                </select>
                <small class="text-muted">Hold Ctrl (or Command on Mac) to select multiple intervals.</small>
            </div>
            @endforeach
        </div>

        <button type="submit" class="btn btn-success">Add Instructor</button>
    </form>
</div>
@endsection
