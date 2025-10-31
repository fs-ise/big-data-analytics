<script>
(function() {
  function currentTitle(slide){
    if(!slide) return document.title || "";
    const h = slide.querySelector("h1, h2, h3");
    return (h && h.textContent.trim()) || document.title || "";
  }
  function update(){
    const el = document.getElementById("slide-title-display");
    if(!el || !window.Reveal) return;
    el.textContent = currentTitle(Reveal.getCurrentSlide());
  }
  Reveal.on('ready', update);
  Reveal.on('slidechanged', update);
})();
</script>
