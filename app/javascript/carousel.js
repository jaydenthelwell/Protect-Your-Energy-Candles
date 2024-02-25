document.addEventListener("DOMContentLoaded", function() {
  const carousel = document.querySelector('.vegan-friendly');
  let position = 0;
  const slidesCount = carousel.querySelectorAll('div').length;

  setInterval(() => {
    position = (position + 1) % slidesCount;
    carousel.style.transform = `translateX(-${position * 100}%)`;
  }, 3000); // Change the interval (in milliseconds) as per your requirement
});
