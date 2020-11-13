ingredients_subset_survival <- function(population, ingredients, path=".") {

	ingredients_survival(population[is.na(population$BETA_BLOCKERS),], ingredients, file.path(path, "non-Betablocker"))
	ingredients_survival(population[!is.na(population$BETA_BLOCKERS),], ingredients, file.path(path, "Betablocker"))

	ingredients_survival(population[is.na(population$TRANSPLANT),], ingredients, file.path(path, "non-Transplant"))
	ingredients_survival(population[!is.na(population$TRANSPLANT),], ingredients, file.path(path, "Transplant"))

	ingredients_survival(population[is.na(population$CIRRHOSIS),], ingredients, file.path(path, "non-Cirrhosis"))
	ingredients_survival(population[!is.na(population$CIRRHOSIS),], ingredients, file.path(path, "Cirrhosis"))

	ingredients_survival(population[is.na(population$GI_Bleeding),], ingredients, file.path(path, "non-GI-Bleeding"))
	ingredients_survival(population[!is.na(population$GI_Bleeding),], ingredients, file.path(path, "GI-Bleeding"))
}

