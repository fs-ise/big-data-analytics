# Quarto slides (template)

Serve:

```
docker compose up
docker compose down
```

Convert PowerPoint:

```
pptx2md "slides.pptx" --output "slides_with_notes.qmd" --enable-slides --qmd --image-dir "images"
```