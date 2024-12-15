<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ asset('images/logos/csucc-logo.png') }}" type="image/png">
    <title>@yield('page-title')</title>
    <link rel="stylesheet" href="{{ asset('styles/layouts/app.css') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @yield('styles')
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar">
        <a href="/" class="navbar-logo">
            <img src="{{ asset('images/logos/csucc-logo.png') }}" alt="Logo">
            <span class="navbar-text">CSUCC Enrollment System</span>
        </a>

        <div class="navbar-links">
            @if (Auth::check())
                <!-- Check if the user is authenticated -->
                <a href="{{ route('logout') }}"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Log Out</a>

                <!-- Include a form to handle logout -->
                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                </form>
            @else
                <a href="{{ route('login') }}">Log In</a>
            @endif
        </div>
    </nav>



    <!-- Sidebar -->
    @auth()
        <div class="sidebar">
            <div class="logo">
                <img src="{{ asset('images/logos/admin-logo.png') }}" alt="Logo">
                <h3>
                    Admin
                    @auth
                        {{ Auth::user()->first_name }} {{ Auth::user()->name ?? 'Admin' }}
                    @endauth
                </h3>
            </div>
            <div class="menu">
                <a href="{{ route('dashboard') }}">Dashboard</a>
                <a href="{{ route('class-schedules.index') }}">Class Schedules</a>
                <a href="{{ route('enrollments.create') }}">Enrollments</a>
                <a href="{{ route('instructors.index') }}">Instructors</a>
                <a href="{{ route('subjects.index') }}">Subjects</a>
                <a href="{{ route('students.index') }}">Students</a>
            </div>
        </div>
    @endauth

    <!-- Main Content -->
    <main>
        @yield('main-content')
    </main>

    <!-- footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-logo-section">
                <a href="/"><img src="{{ asset('images/logos/csucc-logo.png') }}" alt="University Logo"
                        class="footer-logo-img"></a>
                <div class="footer-text">
                    <a href="/">
                        <h3>CARAGA STATE UNIVERSITY</h3>
                    </a>
                    <p>Cabadbaran City</p>
                    <p>T. Curato St., Brgy. 11, Cabadbaran City, Agusan del Norte, Philippines 8605</p>
                    <p>Phone: (085) 818-5538</p>
                    <p>Email: chancellorsoffice@csucc.edu.ph</p>
                </div>
            </div>

            <div class="footer-links-section">
                <div class="footer-contact">
                    <h4>ADMISSION</h4>
                    <p>Email: oasfa@csucc.edu.ph</p>
                    <p>Phone: 0917-7046962</p>
                </div>
                <div class="footer-contact">
                    <h4>REGISTRAR</h4>
                    <p>Email: registrar@csucc.edu.ph</p>
                    <p>Phone: (085) 818-7459</p>
                    <p>Mobile: 0928-4990100</p>
                </div>
                <div class="footer-contact">
                    <h4>GUIDANCE & COUNSELING CENTER</h4>
                    <p>Email: gcc@csucc.edu.ph</p>
                    <p>Phone: 09463451960</p>
                </div>
            </div>
        </div>

        <div class="copyright-text-container">
            <p class="text">Copyright &copy; 2024</p>
            <span class="text withImg">
                <img src="{{ asset('images/logos/csucc-logo.png') }}" alt="University Logo"
                    class="footer-logo-img-copyright">
                <a href="/">Caraga State University Cabadbaran City.</a>
                <p>All Rights Reserved.</p>
            </span>
            <p class="text"></p>
        </div>
    </footer>

    <!-- Modals -->
    @if (session('success'))
        <div id="successModal" class="modal" style="display: none;">
            <div class="modal-content">
                <h2>Success</h2>
                <p>{{ session('success') }}</p>
                <button onclick="closeModal('successModal')">Close</button>
            </div>
        </div>
    @endif

    @if (session('failed'))
        <div id="failedModal" class="modal">
            <div class="modal-content">
                <h2>Error</h2>
                @if (is_array(session('failed')))
                    <ul>
                        @foreach (session('failed') as $field => $errors)
                            @foreach ($errors as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        @endforeach
                    </ul>
                @endif
                <button onclick="closeModal('failedModal')">Close</button>
            </div>
        </div>
    @endif


    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const successModal = document.getElementById('successModal');
            const failedModal = document.getElementById('failedModal');

            if (successModal) successModal.style.display = 'flex'; // Show success modal
            if (failedModal) failedModal.style.display = 'flex'; // Show failed modal
        });

        function closeModal(modalId) {
            const modal = document.getElementById(modalId);
            if (modal) modal.style.display = 'none';
        }
    </script>
    @yield('scripts')
</body>

</html>
