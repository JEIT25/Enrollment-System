@extends('layouts.app')

@section('main-content')
    <div class="container">
        <h1>Subjects</h1>
        <div class="actions">
            <a href="{{ route('subjects.create') }}" class="btn btn-primary">Add Subject</a>
        </div>

        <!-- Search Bar -->
        <div class="form-group">
            <input type="text" id="search_input" class="form-control" placeholder="Search subjects...">
            <button id="search_button" class="btn btn-primary" style="margin-top: 10px;">Search</button>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Credits</th>
                    <th>Weekly Hours</th>
                    <th>Semester</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="subject_table">
                @foreach ($subjects as $subject)
                    <tr>
                        <td>{{ $subject->subject_code }}</td>
                        <td>{{ $subject->subject_name }}</td>
                        <td>{{ $subject->credits }}</td>
                        <td>{{ $subject->weekly_hours }}</td>
                        <td>{{ $subject->semester }}</td>
                        <td>
                            <form action="{{ route('subjects.destroy', $subject->subject_id) }}" method="POST">
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
        }

        .actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .btn {
            padding: 10px 20px;
            color: white;
            background-color: #043b1b;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .btn-danger {
            background-color: #ac1827;
        }

        .btn:hover {
            background-color:#05682e;
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
            background-color: #043b1b;
            color: white;
        }

        .form-group {
            margin-bottom: 20px;
        }

        #search_input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
@endsection

@section('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const searchInput = document.getElementById('search_input');
            const searchButton = document.getElementById('search_button');
            const tableRows = document.querySelectorAll('#subject_table tr');

            const filterTable = () => {
                const query = searchInput.value.toLowerCase();
                tableRows.forEach(row => {
                    const cells = row.querySelectorAll('td');
                    const rowText = Array.from(cells).map(cell => cell.textContent.toLowerCase()).join(' ');
                    row.style.display = rowText.includes(query) ? '' : 'none';
                });
            };

            // Add event listener for search button
            searchButton.addEventListener('click', filterTable);

            // Optionally allow pressing "Enter" in the search input to trigger the search
            searchInput.addEventListener('keydown', event => {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    filterTable();
                }
            });
        });
    </script>
@endsection
