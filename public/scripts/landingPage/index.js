let currentIndex = 0;

function showSlide(index) {
    const slide = document.querySelector('.carousel-slide');
    const images = document.querySelectorAll('.carousel-image');
    const totalImages = images.length;
    currentIndex = (index + totalImages) % totalImages; // Loop around the slides
    slide.style.transform = `translateX(-${currentIndex * 100}%)`;
}

function nextSlide() {
    showSlide(currentIndex + 1);
}

function prevSlide() {
    showSlide(currentIndex - 1);
}

// Initial display
showSlide(currentIndex);

// Auto slide every 3 seconds (3000 ms)
setInterval(nextSlide, 3000);  // You can adjust the interval as needed
