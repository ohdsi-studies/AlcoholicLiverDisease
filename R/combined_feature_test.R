key_build <- function(pattern, select_feature) {
        n <- ncol(select_feature)
	idx <- dec2bin(pattern,n);
        l <- letters[1:n];
        sel <- as.logical(idx);
        l[sel] <- toupper(l[sel]);
        paste(pattern, paste(l, collapse="-"), sep="-")
}


combined_feature_test <- function(population, ingredients, select_feature, basepath) {
        print("combined_feature_test")
        select_feature <- !is.na(as.matrix(population[select_feature]))
        storage.mode(select_feature) <- "integer"

        base2factors <- unlist(lapply((ncol(select_feature)-1):0, function(i) 2^i))
        select_run_pattern <- sort(apply(unique(select_feature), 1, function(x, base2factors) sum(x*base2factors), base2factors))

        dir.create(file.path(tempdir(), basepath), recursive=T, showWarnings=F)
        write.table(local({
			res <- do.call(rbind, lapply(select_run_pattern, function(p, select_feature) {
					idx <- dec2bin(p,ncol(select_feature)); 
					c(p, key_build(p, select_feature), c("No", "Yes")[idx+1])
				}, select_feature
			))
                        colnames(res) <- c("Pattern_int", "KEY", colnames(select_feature))
			return(res)
		}), 
		file.path(tempdir(), basepath, "KEY-summary.csv"), 
		sep="\t", quote=T, row.names=F
	)

	dir.create(file.path(tempdir(), basepath, "features", "complete"), recursive=T, showWarnings=F)
	dir.create(file.path(tempdir(), basepath, "features", "male"), recursive=T, showWarnings=F)
	dir.create(file.path(tempdir(), basepath, "features", "female"), recursive=T, showWarnings=F)

        con = list(
		complete=file(file.path(tempdir(), basepath, "features", "complete", "000_Summary.csv"), "w"),
		male=file(file.path(tempdir(), basepath, "features", "male", "000_Summary.csv"), "w"),
		female=file(file.path(tempdir(), basepath, "features", "female", "000_Summary.csv"), "w")
	)
	print("lapply")	
        lapply(select_run_pattern, function(rpattern, select_feature, population, ingredients, basepath, con) {
			setting <- paste(c("No-", "")[dec2bin(rpattern,ncol(select_feature))+1], colnames(select_feature), sep="")
			path <- file.path(basepath, key_build(rpattern, select_feature))
print(path)
                        idx <- apply(select_feature, 1, function(x, pattern) {
                                        all(x == pattern)
                                }, dec2bin(rpattern, ncol(select_feature))
                        )

			population <- cbind(population, idx=idx)
			population.male <- population[population$GENDER == 8507, ]
			population.female <- population[population$GENDER == 8532, ]

			group <- factor(c(1,2, population$idx+1), labels=c("Other", "Selected"))[-c(1,2)]
		        names(group) <- population$PERSON_ID
		        survival_analysis(group, population, paste(c("complete", key_build(rpattern, select_feature)), collapse="_"), path=file.path(basepath, "features", "complete"), con=con$complete)

			group <- factor(c(1,2,population.male$idx+1), labels=c("Other", "Selected"))[-c(1,2)]
		        names(group) <- population.male$PERSON_ID
		        survival_analysis(group, population.male, paste(c("male", key_build(rpattern, select_feature)), collapse="_"), path=file.path(basepath, "features", "male"), con=con$male)

			group <- factor(c(1,2,population.female$idx+1), labels=c("Other", "Selected"))[-c(1,2)] 
		        names(group) <- population.female$PERSON_ID
		        survival_analysis(group, population.female, paste(c("female", key_build(rpattern, select_feature)), collapse="_"), path=file.path(basepath, "features", "female"), con=con$female)

			population <- population[idx,]
			population.male <- population[population$GENDER == 8507, ]
                        population.female <- population[population$GENDER == 8532, ]

			ingredients_survival(population, ingredients, path = file.path(path, "complete"))
			ingredients_survival(population.male, ingredients, path = file.path(path, "male"))
			ingredients_survival(population.female, ingredients, path = file.path(path, "female"))

                }, select_feature, population, ingredients, basepath, con
        )

        lapply(con, close)

}

