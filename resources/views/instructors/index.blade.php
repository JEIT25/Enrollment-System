@extends('layouts.app')

@section('main-content')
<div class="container">
    <h1>Instructors</h1>
    <a href="{{ route('instructors.create') }}" class="btn btn-primary">Add Instructor</a>
    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Department</th>
                <th>Email</th>
                <th>Availability</th>
            </tr>
        </thead>
        <tbody>
            @foreach($instructors as $instructor)
            <tr>
                <td>{{ $instructor->first_name }} {{ $instructor->last_name }}</td>
                <td>{{ $instructor->department->name ?? 'N/A' }}</td>
                <td>{{ $instructor->email }}</td>
                <td>{{ json_encode($instructor->availability_hours) }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection
