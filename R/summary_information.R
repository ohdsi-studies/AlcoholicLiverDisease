summary_information <- function(population, feature_list, path) {
        path <- file.path(tempdir(), path)
        dir.create(path, showWarnings=F, recursive=T)

	con <- file(file.path(path, "summary.csv"), "w")
	on.exit({ close(con); })
        
	n_entries <- nrow(population)
	writeLines("\nSUMMARY\nKind\tN\tPercent", con)
        writeLines(sprintf("\"Number of patients\"\t%d\t%d", n_entries, 100), con)
        lapply(feature_list, function(feature, population, con) {
			n <- length(which(!is.na(population[[feature]])))
			writeLines(sprintf("\"%s\"\t%d\t%.5f", feature, n, n / nrow(population) * 100), con)
		}, population, con
	)

	gender <- table(population$GENDER)

	writeLines("\nGENDER", con)
	write.table(cbind(gender, gender / n_entries * 100), con, sep="\t", col.names=F)

	lapply(feature_list, function(feature, population, con) {
			writeLines(sprintf("\n%s", feature), con)
			lst <- do.call(rbind, tapply(population[[feature]], population$GENDER, function(x) {n <- length(which(!is.na(x) )); c(n=n, "percent_in_gender"=n / length(x) * 100) }))
			write.table(lst, con, sep="\t")
		}, population, con
	)
}
