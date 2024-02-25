document.addEventListener("DOMContentLoaded", function() {
  console.log("DOM content has loaded!");

  const toggler = document.querySelector(".navbar-toggler");

  toggler.addEventListener("click", () => {
    console.log("Toggle clicked")

  })
});
