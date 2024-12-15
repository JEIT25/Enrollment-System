<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{ asset('images/logos/csucc-logo.png') }}" type="image/png">
    <title>Landing Page</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Noto+Sans:ital,wght@0,100..900;1,100..900&display=swap');

        /* Reset some default browser styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Noto Sans', 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        main {
            min-height: 100vh;
            padding-top: 80px;
            /* Adjust the padding to ensure the body content is not covered by the fixed navbar */
        }


        /* General modal styles */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            /* Semi-transparent background */
            justify-content: center;
            align-items: center;
            z-index: 9999;
            /* Make sure it's above other content */
        }

        .modal-content {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .modal h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
        }

        .modal p {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .modal ul {
            text-align: left;
            margin: 0;
            padding-left: 20px;
        }

        .modal li {
            color: #e74c3c;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .modal button {
            background-color: #043b1b;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .modal button:hover {
            background-color: #0a5a1c;
            /* Darker blue on hover */
        }

        .modal button:focus {
            outline: none;
        }

        @media (max-width: 600px) {
            .modal-content {
                width: 95%;
            }

            .modal h2 {
                font-size: 20px;
            }

            .modal p,
            .modal li {
                font-size: 14px;
            }
        }


        /* Add hidden class */
        .hidden {
            display: none;
        }


        /* Navbar styes */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #043b1b;
            /* Vibrant green color */
            padding: 10px 40px;
            color: white;
            margin-bottom: 10px;
        }

        /* Logo and text styling */
        .navbar-logo {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .navbar-logo img {
            height: 65px;
            margin-right: 10px;
            /* Space between logo and text */
        }

        .navbar-logo .navbar-text {
            font-size: 24px;
            font-weight: bold;
            color: #ffcd01;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            /* Adds a subtle shadow */
        }

        /* Navbar links styling */
        .navbar-links {
            display: flex;
            gap: 30px;
        }

        .navbar-links a {
            color: white;
            text-decoration: none;
            font-size: 16px;
            position: relative;
            /* Allows positioning of the pseudo-element */
            font-weight: 600;
        }

        .navbar-links a::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -2px;
            /* Position the line just below the text */
            width: 0;
            /* Initially hidden */
            height: 2px;
            /* Thickness of the line */
            background-color: #ffcd01;
            transition: width 0.3s ease;
            /* Smooth transition */
        }

        .navbar-links a:hover::after {
            width: 100%;
            /* Full width on hover */
        }

        /* footer styles */
        .footer {
            background-color: #043b1b;
            /* Dark green */
            color: #ffffff;
            /* White text */
            font-size: 12px;
            margin-top: 8vh;
            display: flex;
            min-width: 100%;
            flex-direction: column;
            margin-top: 10px;
            z-index: 1000;
            position: relative;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
            margin: auto;
            padding: 3rem;
        }

        .footer-logo-section {
            display: flex;
            align-items: center;
            gap: 15px;
            max-width: 45%;
        }

        .footer-logo-section a {
            text-decoration: none;
        }


        .footer-logo-img {
            width: 120px;
            height: auto;
        }

        .footer-text h3 {
            color: #ffcd01;
            /* Golden yellow */
            font-size: 16px;
            margin: 0;
        }

        .footer-text p {
            margin: 3px 0;
        }

        .footer-links-section {
            display: flex;
            gap: 50px;
        }

        .footer-contact h4 {
            color: #ffcd01;
            /* Golden yellow */
            font-size: 15px;
            margin-bottom: 5px;
        }

        .footer-contact p {
            margin: 3px 0;
        }

        .copyright-text-container,
        .withImg {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 10px;
        }

        .copyright-text-container {
            padding: 2em;
            justify-content: center;
            align-items: center;
            background-color: #131313;
            width: 100%;
            height: 100%;
        }

        .withImg {
            gap: 4px;
        }

        .withImg a {
            text-decoration: none;
            color: #ffcd01;
        }

        .withImg a:hover {
            text-decoration: underline;
        }

        .footer-logo-img-copyright {
            max-width: 2em;
            height: 10px;
            height: auto;
        }

        /* Sidebar Styles */
        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #043b1b;
            color: white;
            position: fixed;
            top: 8vh;
            left: 0;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            z-index: 0;
        }

        .sidebar .logo {
            padding: 20px;
            text-align: center;
        }

        .sidebar .logo img {
            width: 100px;
            margin-bottom: 10px;
        }

        .sidebar .logo h3 {
            font-size: 0.9rem;
            font-weight: bold;
        }

        .sidebar .menu {
            flex-grow: 1;
            padding-left: 20px;
        }

        .sidebar .menu a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 0.95em;
            transition: background-color 0.3s;
        }

        .sidebar .menu a:hover {
            background-color: #2d5a3c;
            border-radius: 5px;
        }


        /* Navbar styles */
        .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #043b1b;
            /* Vibrant green color */
            padding: 10px 40px;
            color: white;
            margin-bottom: 0;
            /* Remove bottom margin */
            position: fixed;
            /* Fixed position to stay at the top */
            width: 100%;
            /* Full width */
            top: 0;
            /* Stick to the top */
            z-index: 1000;
            /* Ensure it stays on top of other content */
        }


        body {
            min-height: 100vh;
        }

        main {
            display: flex;
            align-items: center;
        }

        .carousel-container {
            position: relative;
            max-width: 100%;
            overflow: hidden;
            margin: auto;
            margin: 1rem;
        }

        .carousel-slide {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .carousel-image {
            width: 100%;
            flex-shrink: 0;
            height: fit-content;
            min-height: 85vh;
        }

        .carousel-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            font-size: 24px;
        }

        .carousel-button.left {
            left: 10px;
        }

        .carousel-button.right {
            right: 10px;
        }

        .carousel-button:hover {
            background-color: rgba(0, 0, 0, 0.7);
        }

        @media (max-width: 600px) {
            .carousel-container {
                width: 100%;
            }
        }
    </style>
    <meta name="csrf-token" content="{{ csrf_token() }}">
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
                <a href="{{ route('dashboard') }}">Dashboard</a>
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


    <!-- Main Content -->
    <main>
        <div class="carousel-container">
            <div class="carousel-slide">
                <img src="{{ asset('images/carousel/test1.png') }}" alt="Image 1" class="carousel-image">
                <img src="{{ asset('images/carousel/test2.png') }}" alt="Image 2" class="carousel-image">
                <img src="{{ asset('images/carousel/test3.png') }}" alt="Image 3" class="carousel-image">
            </div>
            <button class="carousel-button left" onclick="prevSlide()">&#10094;</button>
            <button class="carousel-button right" onclick="nextSlide()">&#10095;</button>
        </div>
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
    <script src="{{ asset('scripts/landingPage/index.js') }}"></script>
</body>

</html>
