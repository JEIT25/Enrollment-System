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

        <form id="instructor-form" action="{{ route('instructors.store') }}" method="POST" class="form-container">
            @csrf
            <div class="form-group">
                <label for="first_name">First Name</label>
                <input type="text" name="first_name" class="form-control" value="{{ old('first_name') }}">
            </div>

            <div class="form-group">
                <label for="last_name">Last Name</label>
                <input type="text" name="last_name" class="form-control" value="{{ old('last_name') }}">
            </div>

            <div class="form-group">
                <label for="department_id">Department</label>
                <select name="department_id" class="form-control">
                    <option value="">Select a department</option>
                    @foreach ($departments as $department)
                        <option value="{{ $department->department_id }}"
                            {{ old('department_id') == $department->department_id ? 'selected' : '' }}>
                            {{ $department->department_name }}
                        </option>
                    @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" value="{{ old('email') }}">
            </div>

            <div class="form-group" id="availHours">
                <label>Availability Hours (Monday to Friday)</label>
                @php
                    $days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
                    $timeSlots = [];
                    for ($hour = 7; $hour < 19; $hour++) {
                        $timeSlots[] = sprintf('%02d:00', $hour);
                        $timeSlots[] = sprintf('%02d:30', $hour);
                    }
                    $timeSlots[] = '19:00';
                    $timeSlots[] = '19:30';
                @endphp

                @foreach ($days as $day)
                    <div class="availability-day">
                        <h5 class="day">{{ $day }}</h5>
                        <div class="availability-times">
                            <div class="time-slot">
                                <select name="availability[{{ $day }}][start][]" class="form-control">
                                    <option value="">Start Time</option>
                                    @foreach ($timeSlots as $time)
                                        <option value="{{ $time }}">{{ $time }}</option>
                                    @endforeach
                                </select>
                                <select name="availability[{{ $day }}][end][]" class="form-control">
                                    <option value="">End Time</option>
                                    @foreach ($timeSlots as $time)
                                        <option value="{{ $time }}">{{ $time }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>

            <!-- Hidden input to hold JSON-formatted availability_hours -->
            <input type="hidden" name="availability_hours" id="availability-input">


            <button type="submit" class="btn-submit">Add Instructor</button>
        </form>
    </div>

    <script>
        document.getElementById('instructor-form').addEventListener('submit', function(e) {
            e.preventDefault(); // Prevent default form submission
            const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
            const formData = {};

            days.forEach(day => {
                const daySlots = [];
                const startSelects = document.querySelectorAll(
                    `select[name="availability[${day}][start][]"]`);
                const endSelects = document.querySelectorAll(`select[name="availability[${day}][end][]"]`);

                startSelects.forEach((startSelect, index) => {
                    const startTime = startSelect.value;
                    const endTime = endSelects[index].value;

                    if (startTime && endTime) {
                        if (startTime >= endTime) {
                            alert(`${day}: End time must be later than start time.`);
                            return;
                        }
                        daySlots.push(`${startTime}-${endTime}`);
                    }
                });

                if (daySlots.length) {
                    formData[day] = daySlots;
                }
            });

            // Add the formatted data to a hidden input
            const availabilityInput = document.getElementById('availability-input');
            availabilityInput.value = JSON.stringify(formData);

            // Submit the form
            this.submit();
        });


        function addTimeSlot(button) {
            const timeSlot = document.createElement('div');
            timeSlot.classList.add('time-slot');

            const startSelect = document.createElement('select');
            startSelect.name = button.parentElement.querySelector('h5').textContent.trim() + '[start][]';
            startSelect.classList.add('form-control');
            startSelect.innerHTML = document.querySelector('select[name="availability[Monday][start][]"]').innerHTML;

            const endSelect = document.createElement('select');
            endSelect.name = button.parentElement.querySelector('h5').textContent.trim() + '[end][]';
            endSelect.classList.add('form-control');
            endSelect.innerHTML = document.querySelector('select[name="availability[Monday][end][]"]').innerHTML;

            timeSlot.appendChild(startSelect);
            timeSlot.appendChild(endSelect);
            button.parentElement.querySelector('.availability-times').appendChild(timeSlot);
        }
    </script>



    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container {
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
        }

        .availability-day h5 {
            margin-bottom: 10px;
            font-size: 1rem;
            color: black;
            margin-top: 10px;
        }

        .availability-times {
            display: flex;
            gap: 10px;
        }

        .btn-submit {
            display: inline-block;
            width: 100%;
            padding: 10px 20px;
            background: #007bff;
            color: #fff;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background: #0056b3;
        }

        #availHours {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
@endsection
