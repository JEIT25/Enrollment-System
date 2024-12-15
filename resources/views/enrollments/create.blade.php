@extends('layouts.app')

@section('main-content')
    <div class="container">
        <h1 class="title">Enroll Student</h1>

        <!-- Filters for Students -->
        <div class="filters-row">
            <div class="form-group">
                <label for="student-search" class="label">Search for a Student</label>
                <input id="student-search" type="text" class="input" placeholder="Search by name, email, or student number">
            </div>

            <div class="form-group">
                <label for="year-level-filter" class="label">Filter by Year Level</label>
                <select id="year-level-filter" class="input">
                    <option value="">All Year Levels</option>
                    <option value="1">1st Year</option>
                    <option value="2">2nd Year</option>
                    <option value="3">3rd Year</option>
                    <option value="4">4th Year</option>
                </select>
            </div>
        </div>

        <!-- Student List -->
        <div id="student-list" class="schedule-container">
            <p class="placeholder">Start typing to search for students.</p>
        </div>

        <!-- Schedules and Enroll Section -->
        <div class="drag-and-drop-row">
            <div class="subjects">
                <!-- Filters for Available Subjects -->
                <div class="filters-row">
                    <div class="form-group">
                        <label for="subject-search" class="label">Search for a Subject</label>
                        <input id="subject-search" type="text" class="input" placeholder="Search by subject name or code">
                    </div>
                    <div class="form-group">
                        <label for="day-filter" class="label">Filter by Day</label>
                        <select id="day-filter" class="input">
                            <option value="">All Days</option>
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                        </select>
                    </div>
                </div>

                <!-- Available Schedules -->
                <div id="filtered-schedules" class="schedule-box schedule-container">
                    <p class="placeholder">Search for schedules or filter by day.</p>
                </div>
            </div>

            <!-- Enrolled Schedules -->
            <div class="schedule-box">
                <h2 class="subtitle">Enrolled Schedules</h2>
                <div id="enrolled-schedules" class="enrolled-container">
                    <p class="placeholder">Drag schedules here to enroll.</p>
                </div>
                <!-- Enroll Button -->
                <div class="button-container">
                    <button id="enroll-button" class="enroll">Enroll</button>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('styles')
    <style>
        /* General Styles */

        main {
            padding-bottom: 5rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 1rem;
            font-family: Arial, sans-serif;
        }

        .subjects {
            width: 50%;
        }

        .title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1rem;
            text-align: center;
        }

        .subtitle {
            font-size: 1.25rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .form-group {
            flex: 1;
            margin: 0 1rem 1rem 0;
        }

        .label {
            display: block;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            color: #555;
        }

        .input {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
        }

        /* Filters Row */
        .filters-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 1.5rem;
        }

        /* Drag and Drop Row */
        .drag-and-drop-row {
            display: flex;
            gap: 1.5rem;
        }

        .schedule-box {
            flex: 1;
        }

        /* Schedule Containers */
        .schedule-container,
        .enrolled-container {
            background: #f9f9f9;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            height: 300px;
            overflow-y: auto;
        }

        .enrolled-container {
            border: 2px dashed #ccc;
        }

        .placeholder {
            color: #888;
            text-align: center;
        }

        /* Draggable Items */
        .draggable-item {
            background: #fff;
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            border-radius: 6px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            cursor: grab;
            transition: background-color 0.2s;
            text-transform: capitalize;
        }

        .draggable-item:hover {
            background-color: #f0f8ff;
        }

        /* Button */
        .button-container {
            text-align: center;
            margin-top: 1.5rem;
        }

        .button {
            background-color: #043b1b;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .enroll {
            width: 100%;
            background-color: #043b1b;
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .student-item {
            min-width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .student-item p,
        .student-item button {
            margin: 10px;
        }

        .button:hover,
        .enroll:hover {
            background-color: #0e6331;
        }

        /* Responsive Design */
        @media (max-width: 768px) {

            .filters-row,
            .drag-and-drop-row {
                flex-direction: column;
            }

            .form-group {
                margin-right: 0;
            }
        }
    </style>
@endsection

@section('scripts')
    <script>
document.addEventListener("DOMContentLoaded", () => {
    const enrolledSchedulesContainer = document.querySelector("#enrolled-schedules");
    const enrollButton = document.querySelector("#enroll-button");
    const studentSearchInput = document.querySelector("#student-search");
    const yearLevelFilter = document.querySelector("#year-level-filter");
    const studentListContainer = document.querySelector("#student-list");
    const subjectSearchInput = document.querySelector("#subject-search");
    const dayFilter = document.querySelector("#day-filter");
    const schedulesContainer = document.querySelector("#filtered-schedules");

    let selectedStudentId = null;
    let selectedSchedules = [];

    // Function to initialize draggable items
    const initializeDraggableItems = () => {
        const draggableItems = document.querySelectorAll(".draggable-item");

        draggableItems.forEach(item => {
            item.addEventListener("dragstart", (e) => {
                e.dataTransfer.setData("scheduleId", item.dataset.scheduleId);
            });
        });
    };

    // Function to fetch filtered schedules
    const fetchSchedules = async (query = "", day = "") => {
        try {
            const response = await fetch(`/schedules/search?query=${query}&day=${day}`);
            const schedules = await response.json();

            schedulesContainer.innerHTML = schedules.length
                ? schedules.map(schedule => `
                    <div class="draggable-item" draggable="true" data-schedule-id="${schedule.schedule_id}">
                        <p><strong>Subject:</strong> ${schedule.subject_name}</p>
                        <p><strong>Code:</strong> ${schedule.subject_code}</p>
                        <p><strong>Instructor:</strong> ${schedule.first_name} ${schedule.last_name}</p>
                        <p><strong>Day:</strong> ${schedule.day_of_week}</p>
                        <p><strong>Time:</strong> ${schedule.start_time} - ${schedule.end_time}</p>
                    </div>
                `).join("")
                : '<p class="placeholder">No schedules found.</p>';

            initializeDraggableItems();
        } catch (error) {
            console.error("Error fetching schedules:", error);
        }
    };

    // Fetch all schedules initially
    fetchSchedules();

    // Event listeners for schedule filters
    subjectSearchInput.addEventListener("input", () => {
        fetchSchedules(subjectSearchInput.value, dayFilter.value);
    });

    dayFilter.addEventListener("change", () => {
        fetchSchedules(subjectSearchInput.value, dayFilter.value);
    });

    // Function to fetch filtered students
    const fetchStudents = async (query = "", yearLevel = "") => {
        try {
            const response = await fetch(`/students/search?query=${query}&year_level=${yearLevel}`);
            const students = await response.json();

            studentListContainer.innerHTML = students.length
                ? students.map(student => `
                    <div class="student-item" data-student-id="${student.student_id}">
                        <p><strong>${student.first_name} ${student.last_name}</strong></p>
                        <p>ID No: ${student.student_number}</p>
                        <p>Year Level: ${student.year_level}</p>
                        <p>Email: ${student.email}</p>
                        <button class="button select-student" data-student-full-name="${student.first_name} ${student.last_name}" data-student-id="${student.student_id}">
                            Select
                        </button>
                    </div>
                `).join("")
                : '<p class="placeholder">No students found.</p>';

            document.querySelectorAll(".select-student").forEach(button => {
                button.addEventListener("click", () => {
                    selectedStudentId = button.dataset.studentId;
                    selectedSchedules = [];
                    enrolledSchedulesContainer.innerHTML = '<p class="text-gray-500">Drag schedules here to enroll.</p>';
                    alert(`Selected student: ${button.dataset.studentFullName}`);
                });
            });
        } catch (error) {
            console.error("Error fetching students:", error);
        }
    };

    // Fetch all students initially
    fetchStudents();

    // Event listeners for student filters
    studentSearchInput.addEventListener("input", () => {
        fetchStudents(studentSearchInput.value, yearLevelFilter.value);
    });

    yearLevelFilter.addEventListener("change", () => {
        fetchStudents(studentSearchInput.value, yearLevelFilter.value);
    });

    // Handle drag-and-drop
    enrolledSchedulesContainer.addEventListener("dragover", (e) => {
        e.preventDefault();
    });

    enrolledSchedulesContainer.addEventListener("drop", async (e) => {
        e.preventDefault();

        const scheduleId = e.dataTransfer.getData("scheduleId");
        if (!selectedStudentId) {
            alert("Please select a student first.");
            return;
        }

        if (selectedSchedules.includes(scheduleId)) {
            alert("This schedule is already added.");
            return;
        }

        try {
            const response = await fetch('/enrollments/check-conflicts', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
                body: JSON.stringify({
                    student_id: selectedStudentId,
                    schedule_id: scheduleId,
                }),
            });

            const result = await response.json();
            if (result.conflict) {
                alert(result.message);
            } else {
                const droppedItem = [...document.querySelectorAll(".draggable-item")].find(item => item.dataset.scheduleId === scheduleId);
                enrolledSchedulesContainer.appendChild(droppedItem.cloneNode(true));
                selectedSchedules.push(scheduleId);
            }
        } catch (error) {
            console.error("Error checking conflicts:", error);
        }
    });

    // Handle enroll button
    enrollButton.addEventListener("click", async () => {
        if (!selectedStudentId) {
            alert("No student selected!");
            return;
        }

        if (selectedSchedules.length === 0) {
            alert("No schedules selected!");
            return;
        }

        try {
            const response = await fetch('/enrollments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
                body: JSON.stringify({
                    student_id: selectedStudentId,
                    schedule_id: selectedSchedules,
                }),
            });

            const result = await response.json();
            if (result.success) {
                alert(result.message);
                location.reload();
            } else {
                alert(result.error || "Enrollment failed.");
            }
        } catch (error) {
            console.error("Error enrolling student:", error);
        }
    });
});

    </script>
@endsection
