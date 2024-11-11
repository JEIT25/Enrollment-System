@extends('layouts.app')

@section('styles')
    <link rel="stylesheet" href="{{ asset('styles/landingPage/landingPage.css') }}">
@endsection

@section('page-title','Landing Page')

@section('main-content')
    <div class="carousel-container">
        <div class="carousel-slide">
            <img src="{{ asset('images/carousel/test1.png') }}" alt="Image 1" class="carousel-image">
            <img src="{{ asset('images/carousel/test2.png') }}" alt="Image 2" class="carousel-image">
            <img src="{{ asset('images/carousel/test3.png') }}" alt="Image 3" class="carousel-image">
        </div>
        <button class="carousel-button left" onclick="prevSlide()">&#10094;</button>
        <button class="carousel-button right" onclick="nextSlide()">&#10095;</button>
    </div>
@endsection

@section('scripts')
    <script src="{{ asset('scripts/landingPage/index.js') }}"></script>
@endsection
