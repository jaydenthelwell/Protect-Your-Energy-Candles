document.addEventListener("DOMContentLoaded", function() {
  console.log("Alerts console");
  function toggleAlerts() {
    const light = document.querySelector(".light-alert");
    const dark = document.querySelector(".dark-alert");
    const vegan = document.querySelector(".vegan-friendly-alert");

    const alerts = [light, dark, vegan];
    let currentIndex = 0;

    setInterval(function () {
      // Hide all alerts
      alerts.forEach(alert => alert.classList.add("d-none"));

      // Display the current alert
      alerts[currentIndex].classList.remove("d-none");

      // Move to the next alert or loop back to the first one
      currentIndex = (currentIndex + 1) % alerts.length;
    }, 4000);
  }

  toggleAlerts();

  const alerts = document.querySelector(".alerts");
  const navbar = document.querySelector(".navbar");
  const basketNumber = document.querySelector(".badge");

  console.log("JS Loaded");

  if (alerts) {
    console.log("Alerts Found");

    alerts.addEventListener("click", (event) => {
      console.log("Clicking alerts");
      if (event.target.closest(".fa-xmark")) {
        console.log("Clicking close");
        alerts.classList.add("d-none");
        console.log(alerts.classList);
        navbar.style.paddingTop = ""
        basketNumber.style.top = "30px"
      }
    });

    alerts.style.pointerEvents = "auto";
  } else {
    console.log("Alerts Not Found");
  }
});
