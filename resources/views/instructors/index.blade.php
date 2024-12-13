@extends('layouts.app')

@section('main-content')
    <div class="container">
        <h1>Instructors</h1>
        <div class="actions">
            <input type="text" id="search-bar" placeholder="Search instructors...">
            <a href="{{ route('instructors.create') }}" class="btn btn-primary">Add Instructor</a>
        </div>
        <table class="table" id="instructors-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Email</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($instructors as $instructor)
                    <tr>
                        <td>{{ $instructor->first_name }} {{ $instructor->last_name }}</td>
                        <td>{{ $instructor->department_name ?? 'N/A' }}</td>
                        <td>{{ $instructor->email }}</td>
                        <td>
                            @if ($instructor->availability_hours)
                                @php
                                    $availability = json_decode($instructor->availability_hours, true);
                                @endphp
                                <ul>
                                    @foreach ($availability as $day => $hours)
                                        <li><strong>{{ $day }}:</strong> {{ implode(', ', $hours) }}</li>
                                    @endforeach
                                </ul>
                            @else
                                <em>No availability set</em>
                            @endif
                        </td>
                        <td>
                            <form action="{{ route('instructors.destroy', $instructor->instructor_id) }}" method="POST"
                                onsubmit="return confirm('Are you sure you want to delete this instructor?');">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection


@section('styles')
    <style>
        .container {
            font-family: Arial, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        #search-bar {
            width: 50%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .table th,
        .table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table td {
            color: #555;
        }

        btn-danger {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }
    </style>
@endsection

@section('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchBar = document.getElementById('search-bar');
            const table = document.getElementById('instructors-table');
            const rows = table.querySelectorAll('tbody tr');

            searchBar.addEventListener('input', function() {
                const searchQuery = searchBar.value.toLowerCase();

                rows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    const rowText = Array.from(cells).map(cell => cell.textContent.toLowerCase())
                        .join(' ');

                    if (rowText.includes(searchQuery)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>
@endsection
