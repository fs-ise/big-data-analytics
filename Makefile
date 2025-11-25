PRESENTATION = all_lectures.qmd

pdf: ## (local) Create a pdf using tinytext
	docker compose exec quarto \
		quarto render /project/${PRESENTATION} --to pdf
