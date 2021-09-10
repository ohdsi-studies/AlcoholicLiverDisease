ingredients_survival <- function (population, ingredients, path = ".") {

	dir.create(file.path(tempdir(), path), recursive = T, showWarnings=F)

	print(file.path(tempdir(), path, "000_DRUG_SUMMARY.xls"))

	con <- file(file.path(tempdir(), path, "000_DRUG_SUMMARY.xls"), open = "w")

	run_ingredients <- names(which(table(ingredients$INGREDIENT_NAME)/length(unique(ingredients[[getIDColName(ingredients)]])) >= 0.01))
	names(run_ingredients) <- run_ingredients

	.ingredients_survival <- function(substance, population, ingredients, path = ".", con = stdout()) {
		tryCatch({
				group <- c(1, 2, as.integer(population[[getIDColName(population)]] %in% 
				ingredients[ingredients$INGREDIENT_NAME == substance, ][[getIDColName(ingredients)]]) + 1)
				group <- factor(group, labels = c("drug not used", substance))
				group <- group[-c(1, 2)]
				names(group) <- population[[getIDColName(population)]]
				survival_analysis(group, population, substance, path = path, con = con)
			}, error = function(e) {
				print(substance)
				print(group)
				stop(e)
			}
		)
	}

	lapply(run_ingredients, .ingredients_survival, population, ingredients, path, con)
	close(con)
}

