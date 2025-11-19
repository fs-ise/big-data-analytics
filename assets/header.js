<script>
(function() {
  function updateTitle() {
    const el = document.getElementById("slide-title-display");
    if (!el || !window.Reveal) return;

    const slide = Reveal.getCurrentSlide();
    if (!slide) return;

    // Check if the current slide is the intro
    if (slide.classList.contains("firstIntro")) {
      // Hide the title element entirely
      el.style.display = "none";
      el.textContent = "";
    } else {
      // Show the title and update its content
      el.style.display = "";
      const h = slide.querySelector("h1, h2, h3");
      el.textContent = (h && h.textContent.trim()) || "";
    }
  }

  Reveal.on("ready", updateTitle);
  Reveal.on("slidechanged", updateTitle);
})();
</script>
