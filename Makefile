PRESENTATION = all_lectures.qmd

pdf: ## Render all_lectures.qmd to PDF using docker compose
	docker compose run --rm quarto \
		quarto render /project/all_lectures.qmd --to pdf