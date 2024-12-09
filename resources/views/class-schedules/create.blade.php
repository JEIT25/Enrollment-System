@extends('layouts.app')
@section('styles')
    <style>
        main {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            padding: 1rem;
            width: 100%;
            justify-content: center;
            min-height: 100vh;
            padding-left: 10vw;
            padding-top: 8vh;
        }

        ul {
            display: flex;
            flex-direction: column;
        }

        li {
            list-style: none;
        }

        .left-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            min-width: 300px;
            max-width: 800px;
            height: 100vh;
        }

        .right-side {
            flex: 0.4;
            padding: 1rem;
            border: 2px solid #333;
            background-color: #022c1b;
            border-radius: 8px;
            color: white;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            min-width: 300px;
            max-width: 400px;
        }

        .search-bar {
            display: flex;
            gap: 0.5rem;
        }

        .search-input {
            flex: 1;
            padding: 0.5rem;
            font-size: 1rem;
            border: 2px solid #065f46;
            border-radius: 4px;
        }

        .search-button {
            padding: 0.5rem 1rem;
            font-size: 1rem;
            color: white;
            background-color: #065f46;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .search-button:hover {
            background-color: #0a8057;
        }

        .draggable-container {
            padding: 1rem;
            border: 2px solid #333;
            background-color: #043b1b;
            color: white;
            border-radius: 8px;
            overflow-y: auto;
            padding: 1rem;
        }

        .items {
            display: flex;
            gap: 1rem;
        }

        .draggable-item {
            padding: 0.5rem;
            border: 2px solid white;
            border-radius: 4px;
            background-color: #065f46;
            color: white;
            cursor: grab;
            transition: transform 0.2s, background-color 0.2s;
        }

        .draggable-item:hover {
            background-color: #0a8057;
            transform: scale(1.05);
        }

        .selected-items {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .selected-card {
            padding: 1rem;
            border: 2px solid #444;
            border-radius: 8px;
            background-color: #065f46;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            gap: 0.5rem;
        }

        .selected-card h4 {
            margin: 0;
            font-size: 1.2rem;
        }

        .selected-card p {
            margin: 0;
            font-size: 1rem;
        }

        .time-selection {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            color: white;
        }

        .time-dropdown {
            padding: 0.5rem;
            font-size: 1rem;
            border: 2px solid #065f46;
            border-radius: 4px;
            background-color: #043b1b;
            color: white;
        }

        .schedule-item {
            display: flex;
            flex-direction: column;
        }


        button[type="submit"] {
            padding: 0.5rem 1rem;
            background-color: #065f46;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.2s;
            margin-top: 20px;
            min-width: 100%;
        }

        button[type="submit"]:hover {
            background-color: #0a8057;
        }

        @media (max-width: 768px) {
            main {
                flex-direction: column;
            }

            .right-side {
                width: 100%;
            }

            .left-side {
                width: 100%;
            }
        }
    </style>
@endsection

@section('main-content')
    <form action="{{ route('class-schedules.store') }}" method="POST">
        @csrf
        <main>
            <div class="left-side">
                <div class="search-bar">
                    <input type="text" id="search-bar" class="search-input" placeholder="Search items...">
                </div>

                <div class="draggable-container">
                    <h3>Available Items</h3>
                    <div class="items" id="items-container">

                        <div class="section">
                            <h4>Instructors</h4>
                            @foreach ($instructors as $instructor)
                                <div class="draggable-item" draggable="true" data-type="instructor"
                                    data-id="{{ $instructor->instructor_id }}">
                                    <strong>Name:</strong> {{ $instructor->first_name }} {{ $instructor->last_name }}<br>
                                    <strong>Email:</strong> {{ $instructor->email }}<br>
                                    <strong>Availability Hours:</strong>
                                    <ul>
                                        @php
                                            $availabilityHours = json_decode($instructor->availability_hours, true);
                                            $convertTo12Hour = function ($timeRange) {
                                                [$start, $end] = explode('-', $timeRange);
                                                $startTime = \Carbon\Carbon::createFromFormat('H:i', $start)->format(
                                                    'g:i A',
                                                );
                                                $endTime = \Carbon\Carbon::createFromFormat('H:i', $end)->format(
                                                    'g:i A',
                                                );
                                                return $startTime . ' - ' . $endTime;
                                            };
                                        @endphp
                                        @foreach ($availabilityHours as $day => $hours)
                                            <li>
                                                <strong>{{ $day }}:</strong>
                                                {{ implode(', ', array_map($convertTo12Hour, $hours)) }}||
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                        </div>


                        <div class="section">
                            <h4>Rooms</h4>
                            @foreach ($rooms as $room)
                                <div class="draggable-item" draggable="true" data-type="room"
                                    data-capacity="{{ $room->room_capacity }}" data-id="{{ $room->room_id }}">
                                    <strong>Building:</strong> {{ $room->building_name }}<br>
                                    <strong>Room Number:</strong> {{ $room->room_number }}<br>
                                    <strong>Capacity:</strong> {{ $room->room_capacity }}
                                </div>
                            @endforeach
                        </div>

                        <div class="section">
                            <h4>Subjects</h4>
                            @foreach ($subjects as $subject)
                                <div class="draggable-item" draggable="true" data-type="subject"
                                    data-id="{{ $subject->subject_id }}">
                                    <strong>Subject Name:</strong> {{ $subject->subject_name }}<br>
                                    <strong>Code:</strong> {{ $subject->subject_code }}<br>
                                    <strong>Units:</strong> {{ $subject->credits }}
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>

            <div class="right-side">
                <h3>Selected Items</h3>
                <div class="selected-items">
                    <div class="selected-card" id="selected-instructor" data-type="instructor">
                        <h4>Instructor</h4>
                        <p>No instructor selected</p>
                    </div>
                    <div class="selected-card" id="selected-room" data-type="room">
                        <h4>Room</h4>
                        <p>No room selected</p>
                    </div>
                    <div class="selected-card" id="selected-subject" data-type="subject">
                        <h4>Subject</h4>
                        <p>No subject selected</p>
                    </div>
                </div>

                <!-- Hidden form inputs -->
                <input type="hidden" name="instructor_id" id="form-instructor">
                <input type="hidden" name="room_id" id="form-room">
                <input type="hidden" name="subject_id" id="form-subject">
            </div>
        </main>
    </form>
@endsection

@section('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const searchBar = document.querySelector('#search-bar');
            const itemsContainer = document.querySelector('#items-container')

            // Prevent form submission when pressing Enter in the search bar
            searchBar.addEventListener('keydown', (event) => {
                if (event.key === 'Enter') {
                    event.preventDefault(); // Stop the default submit action
                    // You can add your search logic here
                    console.log('Search triggered:', searchBar.value);
                }
            });


            searchBar.addEventListener('input', () => {
                const query = searchBar.value.toLowerCase();
                const items = itemsContainer.querySelectorAll('.draggable-item');
                items.forEach(item => {
                    if (item.textContent.toLowerCase().includes(query)) {
                        item.style.display = ''; // Show item
                    } else {
                        item.style.display = 'none'; // Hide item
                    }
                });
            });


            const selectedItems = {
                instructor: {
                    element: document.querySelector('#selected-instructor'),
                    input: document.querySelector('#form-instructor')
                },
                room: {
                    element: document.querySelector('#selected-room'),
                    input: document.querySelector('#form-room'),
                    capacity: null,
                },
                subject: {
                    element: document.querySelector('#selected-subject'),
                    input: document.querySelector('#form-subject')
                },
            };

            const draggableItems = document.querySelectorAll('.draggable-item');
            const rightSideContainer = document.querySelector('.right-side');
            const fetchScheduleButton = document.createElement('button');

            fetchScheduleButton.textContent = 'Fetch Available Schedules';
            fetchScheduleButton.type = 'button';
            fetchScheduleButton.disabled = true; // Initially disabled
            fetchScheduleButton.classList.add('search-button');
            rightSideContainer.appendChild(fetchScheduleButton);

            const updateSelectedCard = (type, content, id, capacity) => {
                selectedItems[type].element.innerHTML =
                    `<h4>${type.charAt(0).toUpperCase() + type.slice(1)}</h4><p>${content}</p>`;
                selectedItems[type].input.value = id;
                if (type == "room") {
                    selectedItems.room.capacity = capacity
                }
            };

            const checkSelectionsComplete = () => {
                return Object.values(selectedItems).every(({
                    input
                }) => input.value !== '');
            };

            const enableFetchButton = () => {
                fetchScheduleButton.disabled = !checkSelectionsComplete();
            };

            draggableItems.forEach(item => {
                item.addEventListener('dragstart', (e) => {
                    e.dataTransfer.setData('type', item.dataset.type);
                    e.dataTransfer.setData('id', item.dataset.id);
                    e.dataTransfer.setData('content', item.textContent.trim());
                    e.dataTransfer.setData('capacity', item.dataset.capacity);
                });
            });

            rightSideContainer.addEventListener('dragover', (e) => {
                e.preventDefault();
            });

            rightSideContainer.addEventListener('drop', (e) => {
                e.preventDefault();
                const type = e.dataTransfer.getData('type');
                const id = e.dataTransfer.getData('id');
                const content = e.dataTransfer.getData('content');
                const capacity = e.dataTransfer.getData('capacity');

                if (selectedItems[type]) {
                    updateSelectedCard(type, content, id, capacity);
                    enableFetchButton();
                }
            });

            fetchScheduleButton.addEventListener('click', async () => {
                const roomId = selectedItems.room.input.value;
                const instructorId = selectedItems.instructor.input.value;
                const subjectId = selectedItems.subject.input.value;
                const roomCapacity = selectedItems.room.capacity;

                try {
                    const response = await fetch(
                        `/class-schedules/get-available-schedules?room_id=${roomId}&instructor_id=${instructorId}&subject_id=${subjectId}`
                    );
                    if (!response.ok) throw new Error('Failed to fetch schedules');

                    const schedules = await response.json();

                    // Create a container for the schedule inputs
                    const scheduleContainer = document.createElement('div');
                    scheduleContainer.id = 'generated-schedule';

                    if (Object.keys(schedules).length > 0) {
                        // Create day selection dropdown
                        const days = Object.keys(schedules);
                        scheduleContainer.innerHTML = `
                <div class="schedule-item">
                    <label for="semester">Semester</label>
                    <select id="semester" name="semester">
                        <option value="First">1st</option>
                        <option value="Second">2nd</option>
                        <option value="Summer">Summer</option>
                    </select>

                    <label for="day-of-week">Day of the Week:</label>
                    <select id="day-of-week" name="day_of_week">
                        ${days.map(day => `<option value="${day}">${day}</option>`).join('')}
                    </select>

                    <label for="start-time">Start Time:</label>
                    <select id="start-time" name="start_time"></select>

                    <label for="end-time">End Time:</label>
                    <select id="end-time" name="end_time"></select>

                    <input hidden readonly type="number" id="max_students" name="max_students" value=${selectedItems.room.capacity}></input>

                </div>
            `;

                        //create the submit button if the response is ok
                        const submitBtn = document.createElement('button');
                        submitBtn.textContent = 'submit';
                        submitBtn.type = 'submit';
                        submitBtn.classList.add('search-button');
                        submitBtn.classList.add('submitBtn');
                        scheduleContainer.appendChild(submitBtn);

                        // Clear existing schedule and append the new one
                        const existingSchedule = document.getElementById('generated-schedule');
                        if (existingSchedule) existingSchedule.remove();
                        rightSideContainer.appendChild(scheduleContainer);

                        const daySelect = document.getElementById('day-of-week');
                        const startTimeSelect = document.getElementById('start-time');
                        const endTimeSelect = document.getElementById('end-time');

                        // Function to convert 24-hour time to 12-hour format
                        function to12HourFormat(time) {
                            const [hours, minutes] = time.split(':');
                            const period = +hours >= 12 ? 'PM' : 'AM';
                            const adjustedHours = +hours % 12 || 12; // Convert to 12-hour format
                            return `${adjustedHours}:${minutes} ${period}`;
                        }


                        const updateTimeOptions = (day) => {
                            const daySchedules = schedules[day] || [];
                            const startTimes = [...new Set(daySchedules.map(s => s.start_time))];
                            const endTimes = [...new Set(daySchedules.map(s => s.end_time))];

                            // Populate start time options
                            startTimeSelect.innerHTML = startTimes.map(start =>
                                    `<option value="${start}">${to12HourFormat(start)}</option>`)
                                .join('');

                            // Populate end time options
                            endTimeSelect.innerHTML = endTimes.map(end =>
                                `<option value="${end}">${to12HourFormat(end)}</option>`).join(
                                '');
                        };

                        // Update times on day selection change
                        daySelect.addEventListener('change', () => {
                            updateTimeOptions(daySelect.value);
                        });

                        startTimeSelect.addEventListener('change', () => {
                            validateTimeSelection(startTimeSelect, endTimeSelect)
                        })

                        endTimeSelect.addEventListener('change', () => {
                            validateTimeSelection(startTimeSelect, endTimeSelect)
                        })

                        // Initialize options for the first day
                        updateTimeOptions(days[0]);
                    } else {
                        alert('No available schedules found.');
                    }
                } catch (error) {
                    alert('Error fetching available schedules. Please try again.');
                    console.error(error);
                }
            });


            // Function to validate that end_time is not less than or equal to start_time
            function validateTimeSelection(startSelect, endSelect) {
                const startTime = startSelect.value;
                const endTime = endSelect.value;

                if (startTime && endTime) {
                    const startTimeMinutes = convertToMinutes(startTime);
                    const endTimeMinutes = convertToMinutes(endTime);

                    if (endTimeMinutes <= startTimeMinutes) {
                        alert('End time must be greater than start time');
                        endSelect.setCustomValidity('End time must be greater than start time');
                    } else {
                        endSelect.setCustomValidity('');
                    }
                }
            }

            // Helper function to convert time to minutes (e.g., "7:30" => 450)
            function convertToMinutes(time) {
                const [hours, minutes] = time.split(':').map(Number);
                return hours * 60 + minutes;
            }

        });
    </script>
@endsection
