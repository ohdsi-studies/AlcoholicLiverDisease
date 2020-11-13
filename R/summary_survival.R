summary_survival <- function(population, path=".") {

        dir.create(file.path(tempdir(), path), recursive=T, showWarnings=F)
        con <- file(file.path(tempdir(), path, '000_SUMMARY.csv'), open="w")

	group <- factor(c(1, 2, as.integer(!is.na(population$BETA_BLOCKERS ))+1), labels=c("No Betablocker", "BetaBlocker"))[-c(1,2)]
	names(group) <- population$PERSON_ID
	survival_analysis(group, population, "Betablocker", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$TRANSPLANT ))+1), labels=c("No Transplant", "Transplant"))[-c(1,2)]
	names(group) <- population$PERSON_ID
	survival_analysis(group, population, "Transplant", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$CIRRHOSIS ))+1), labels=c("No Cirrhosis", "Cirrhosis"))[-c(1,2)]
	names(group) <- population$PERSON_ID
	survival_analysis(group, population, "Cirrhosis", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$GI_BLEEDING ))+1), labels=c("No GI Bleeding", "GI Bleeding"))[-c(1,2)]
	names(group) <- population$PERSON_ID
	survival_analysis(group, population, "GI Bleeding", path=path, con=con)

        close(con)
}

