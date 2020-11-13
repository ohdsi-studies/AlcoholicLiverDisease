check_population <- function(population) {
	columns <- c("CONDITION_START", "CONDITION_STOP", "OBSERVATION_START", "OBSERVATION_STOP", "DEATH_DATE", "DEATH_OR_OP_END_DATE", "TIME_TO_EVENT", "STATUS_ON_EVENT")
	names(columns) <- columns
	print(lapply(columns, function(col, population) {
			column <- population[[col]]
			data.frame(r=as.list(range(column)), r2=as.list(range(column, na.rm=T)), "IsNA"=length(which(is.na(column))), NotNA=length(which(!is.na(column))), "IsInf"=length(which(is.infinite(column))), NotInf=length(which(!is.infinite(column))), N=length(column))
		}, population
	))


	tmp <- population[["CONDITION_START"]] <= population[["OBSERVATION_STOP"]]
	print(length(which(is.na(tmp)))); print(table(tmp));
	tmp <- population[["CONDITION_START"]] <= population[["DEATH_DATE"]]
        print(length(which(is.na(tmp)))); print(table(tmp));
        tmp <- population[["CONDITION_START"]] <= population[["DEATH_OR_OP_END_DATE"]]
        print(length(which(is.na(tmp)))); print(table(tmp));

}

# check_population(population)
