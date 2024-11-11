<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="{{asset('images/logos/csucc-logo.png')}}" type="image/png">
    <title>@yield('page-title')</title>
    <link rel="stylesheet" href="{{ asset('styles/layouts/app.css') }}">
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
            <a href="#">Log In</a>
            <a href="#">About</a>
        </div>
    </nav>

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
                <img src="{{ asset('images/logos/csucc-logo.png') }}" alt="University Logo" class="footer-logo-img-copyright">
                <a href="/">Caraga State University Cabadbaran City.</a>
                <p>All Rights Reserved.</p>
            </span>
            <p class="text"></p>
        </div>
    </footer>

    @yield('scripts')
</body>

</html>
