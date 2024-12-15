@extends('layouts.app')

@section('styles')
    <style>
        main {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
        }
        .container {
            background-color: #fff;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 100%;
            max-width: 600px; /* Increased the max-width for a larger form */
            padding: 40px; /* Increased padding for more space around content */
            box-sizing: border-box;
            text-align: center;
            height: 50vh;
        }

        h2 {
            color: #043b1b;
            font-size: 28px; /* Slightly larger font size */
            margin-bottom: 30px;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 25px; /* Increased margin for more space between inputs */
            text-align: left;
        }

        label {
            font-weight: bold;
            color: #043b1b;
            margin-bottom: 8px; /* Increased margin for spacing between label and input */
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px; /* Increased padding for larger input fields */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 18px; /* Increased font size for better readability */
            color: #333;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #043b1b;
        }

        button[type="submit"] {
            background-color: #043b1b;
            color: white;
            padding: 14px; /* Increased padding for a larger button */
            border: none;
            border-radius: 5px;
            font-size: 18px; /* Increased font size for the button */
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover {
            background-color: #032915;
        }

        .alert {
            color: #ff0000;
            background-color: #f8d7da;
            border-radius: 5px;
            padding: 12px; /* Increased padding for alert box */
            margin-bottom: 25px; /* Increased margin for spacing */
        }

        .alert ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        .alert ul li {
            margin-bottom: 8px; /* Increased spacing between alert messages */
        }
    </style>
@endsection

@section('main-content')
    <div class="container">
        <h2>Login</h2>

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

        <form method="POST" action="{{ route('login') }}">
            @csrf

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" class="form-control" value="{{ old('email') }}" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
@endsection
