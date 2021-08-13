ingredients_combinations <- function(population, ingredients, path) {
	
	dir.create(file.path(tempdir(), path), recursive = T, showWarnings=F)

	con <- file(file.path(tempdir(), path, "000_DRUG_SUMMARY.csv"), open = "w")

	
	ingredients$INGREDIENT_CONCEPT_ID %in% 1112807
	
	group_lst <- list(
		Aspirin = unique(ingredients[ingredients$INGREDIENT_CONCEPT_ID %in% 1112807, "PERSON_ID"]),
		Metformin = unique(ingredients[ingredients$INGREDIENT_CONCEPT_ID %in% 1503297, "PERSON_ID"]),
		BetaBlocker =  unique(ingredients[ingredients$INGREDIENT_CONCEPT_ID %in% c(1319998, 1314002, 1322081, 1338005, 19063575, 1314577, 1307046, 950370, 1327978, 1345858, 1346823, 1386957, 932815, 905531, 1313200, 1353766, 1370109, 902427), "PERSON_ID"])
	)

	lapply(names(group_lst), function(ctrl, group_lst) {
			group <- rep(NA, nrow(population))
			names(group) <- population$PERSON_ID

			group[names(group) %in% group_lst[[ctrl]]] <- 1
			group[names(group) %in% names(which(table(unlist(group_lst)) == 3))] <- 2

			group <- factor(c(1,2,group), labels=c(ctrl, paste(names(group_lst), collapse=", ")))[-c(1,2)]

			survival_analysis(group, population, sprintf("combination_vs_%s", ctrl), path = path, con = con)

			lapply(names(group_lst)[names(group_lst) != ctrl], function(probe, ctrl, group_lst) {
					group <- rep(NA, nrow(population))
					names(group) <- population$PERSON_ID

					### Reference (include also others)
					group[names(group) %in% group_lst[[ctrl]]] <- 1
					### Overwrite probe group
					group[names(group) %in% names(which(table(unlist(group_lst[c(probe, ctrl)])) == 2))] <- 2
					### Clean probe and ctrl while also get other selected dugs
					group[names(group) %in% unique(unlist(group_lst[!names(group_lst) %in% c(ctrl, probe)]))] <- NA

					group <- factor(c(1,2,group), labels=c(ctrl, paste(probe, ctrl, sep=", ")))[-c(1,2)]

					survival_analysis(group, population, sprintf("%s_%s-vs-%s", probe, ctrl, ctrl), path = path, con = con)

				}, ctrl, group_lst
			)

		}, group_lst
	)
	close(con)
}


