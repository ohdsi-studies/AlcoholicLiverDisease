summary_survival <- function(population, path=".") {

        dir.create(file.path(tempdir(), path), recursive=T, showWarnings=F)
        con <- file(file.path(tempdir(), path, '000_SUMMARY.xls'), open="w")

	group <- factor(c(1, 2, as.integer(!is.na(population$BETA_BLOCKERS ))+1), labels=c("No Betablocker", "BetaBlocker"))[-c(1,2)]
	names(group) <- population[[getIDColName(population)]]
	survival_analysis(group, population, "Betablocker", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$TRANSPLANT ))+1), labels=c("No Transplant", "Transplant"))[-c(1,2)]
	names(group) <- population[[getIDColName(population)]]
	survival_analysis(group, population, "Transplant", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$CIRRHOSIS ))+1), labels=c("No Cirrhosis", "Cirrhosis"))[-c(1,2)]
	names(group) <- population[[getIDColName(population)]]
	survival_analysis(group, population, "Cirrhosis", path=path, con=con)

	group <- factor(c(1, 2, as.integer(!is.na(population$GI_BLEEDING ))+1), labels=c("No GI Bleeding", "GI Bleeding"))[-c(1,2)]
	names(group) <- population[[getIDColName(population)]]
	survival_analysis(group, population, "GI Bleeding", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$FIBROSIS))+1), labels=c("No Fibrosis", "Fibrosis"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Fibrosis", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$ENCEPHALOPATHY))+1), labels=c("No Encephalopathy", "Encephalopathy"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Encephalopathy", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$HCC))+1), labels=c("No HCC", "HCC"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "HCC", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$ALCINDUCEDORGANICMENTALDISORDER))+1), labels=c("No Alcohol induced organic, mental disorder", "Alcohol induced organic, mental disorder"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Alcohol induced organic, mental disorder", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$SCHIZOPHRENIA ))+1), labels=c("No Schizophrenia", "Schizophrenia"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Schizophrenia", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$ASCITES ))+1), labels=c("No Ascites", "Ascites"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Ascites", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$HEPATITISB ))+1), labels=c("No Hepatitis B", "Hepatitis B"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Hepatitis B", path=path, con=con)

        group <- factor(c(1, 2, as.integer(!is.na(population$HEPATITISC ))+1), labels=c("No Hepatitis C", "Hepatitis C"))[-c(1,2)]
        names(group) <- population[[getIDColName(population)]]
        survival_analysis(group, population, "Hepatitis C", path=path, con=con)



        close(con)
}
