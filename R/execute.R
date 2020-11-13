execute <- function(connectionDetails,  sourceName) {

	execute <- function(connectionDetails,  studyName, sourceName, inputFile) {
	    default_options <- options(warn = 1)
            dir.create(file.path(tempdir(), studyName, sourceName), recursive=T, showWarnings=F)
	    logfile <- file(file.path(tempdir(), studyName, sourceName, "log.txt"))
	    sink(logfile)
	    sink(logfile, type="message")

	    conn <- DatabaseConnector::connect(connectionDetails)

	    # when finished
	    on.exit({
	        cat("Clean up ...\n");
	        sql <- prepareSql(connectionDetails$dbms,
	                    cdmSchema=connectionDetails$schema, 
	                    studyName=studyName, sourceName=sourceName, 
	                    inputFile=system.file("sql", "cleanup.sql", package="AlcoholicLiverDisease", mustWork=TRUE),
	                    outputFile=file.path(tempdir(), sprintf("cleanup_%s_%s.sql", connectionDetails$dbms, studyName))
	        )
	        DatabaseConnector::executeSql(conn, SqlRender::readSql(sql))
	        cat("Closing connection ...\n"); 
	        DBI::dbDisconnect(conn);

#		cat("\n************************************************\n***************** WARNINGS *********************\n************************************************\n\n")
#		print(warnings())
		sink()
		sink(type="message")
		options(default_options)

	    })

	    # .... execution ....
	    # ....
	    # ....

	    sql <- prepareSql(connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName, inputFile=inputFile)
	    DatabaseConnector::executeSql(conn, SqlRender::readSql(sql))

	    codesets <- exportFromDB(conn, "codesets", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    drugs <- exportFromDB(conn, "drugs", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    ingredients <- exportFromDB(conn, "ingredients", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    meld <- exportFromDB(conn, "meld", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    summary <- exportFromDB(conn, "summary", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    trans <- exportFromDB(conn, "trans", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    gibleeding <- exportFromDB(conn, "gibleeding", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    cirrhosis <- exportFromDB(conn, "cirrhosis", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	    events <- exportFromDB(conn, "events", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName) 
	#    hepatitisB <- exportFromDB(conn, "hepatitisB", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)
	#    hepatitisC <- exportFromDB(conn, "hepatitisC", connectionDetails$dbms, cdmSchema=connectionDetails$schema, studyName=studyName, sourceName=sourceName)

	    feature_list <- c("GI_BLEEDING", "CIRRHOSIS", "BETA_BLOCKERS", "TRANSPLANT", "FIBROSIS", "ENCEPHALOPATHY", "HCC", "ALCINDUCEDORGANICMENTALDISORDER", "SCHIZOPHRENIA", "ASCITES", "HEPATITISB", "HEPATITISC")

	    population <- preparePopulationTable(summary)
	    write.table(population, file.path(tempdir(), "permitted-files", studyName, sourceName, "population.csv"), quote=T, sep="\t")

	    summary_information(population, feature_list, file.path(studyName, sourceName))

	    print(file.path(tempdir(), "permitted-files", studyName, sourceName, "codesets.csv"))
	    print(file.path(tempdir(), studyName, sourceName, "codesets.csv"))
	    print(file.rename(file.path(tempdir(), "permitted-files", studyName, sourceName, "codesets.csv"), file.path(tempdir(), studyName, sourceName, "codesets.csv")))

	    # MALE: concept_id = 8507
	    # FEMALE: concept_id = 8532

	    population.male <- population[population$GENDER == 8507, ]
	    population.female <- population[population$GENDER == 8532, ]

	    group <- factor(population$GENDER)
	    names(group) <- population$PERSON_ID
	    survival_analysis(group, population, "Gender", file.path(studyName, sourceName, "summary"))

	    ### Summary survival analysis
	    summary_survival(population, file.path(studyName, sourceName, "summary", "complete"))
	    summary_survival(population.male, file.path(studyName, sourceName, "summary", "male"))
	    summary_survival(population.female, file.path(studyName, sourceName, "summary", "female"))

	    ### Ingredients / DRUGs analysis
	    ingredients_select <- read.delim(system.file("lists", "Ingredients.csv", package="AlcoholicLiverDisease", mustWork=T))
	    ingredients_select <- ingredients[ingredients$INGREDIENT_CONCEPT_ID %in% ingredients_select$concept_id,]
	    ingredients_survival(population, ingredients_select, file.path(studyName, sourceName, "drugs", "complete"))
	    ingredients_survival(population.male, ingredients_select, file.path(studyName, sourceName, "drugs", "male"))
	    ingredients_survival(population.female, ingredients_select, file.path(studyName, sourceName, "drugs", "female"))

	    combined_feature_test(
			population, 
			ingredients_select, 
			feature_list, 
			file.path(studyName, sourceName, "combined_features")
	    )

	    lst <- list()
	    lst$data <- summary
	    lst$ingredients <- ingredients
	    lst$population <- population

	    writeLines(capture.output(sessionInfo()), logfile)


	    #### zip data
	    cat(sprintf("***************************\nStart Zip file at %s\n", format(Sys.time(), "%Y-%m-%d_%H-%M_%Z")))
	    old <- setwd(tempdir())
	    zipFile <- sprintf("AlcoholicLiverDisease_%s_%s_%s.zip", sourceName, studyName, format(Sys.time(), "%Y-%m-%d_%H-%M_%Z"))
	    if(file.exists(zipFile)) file.remove(zipFile)
	    zip(zipFile, files=sprintf(file.path(".", "%s"), studyName));
	    cat(sprintf("***************************\nZip file of results can be found in %s\nnamed: %s\n", tempdir(), zipFile))
    
	    setwd(old)

	    invisible(lst)
	}

	
	execute(connectionDetails,  "nohep", sourceName, inputFile=system.file("sql", "ald-mannheim-no-hepatitis.sql", package="AlcoholicLiverDisease", mustWork=TRUE))
	execute(connectionDetails,  "hepB",  sourceName, inputFile=system.file("sql", "ald-mannheim-hepatitis-b.sql", package="AlcoholicLiverDisease", mustWork=TRUE))
	execute(connectionDetails,  "hepC",  sourceName, inputFile=system.file("sql", "ald-mannheim-hepatitis-c.sql", package="AlcoholicLiverDisease", mustWork=TRUE))

	cat("\n\nExecution is finished!\n---------------------\n\nPlease transfer following files:\n")
	cat(paste(" * ", grep("zip$", dir(tempdir(), full.names=T), value=T, ignore.case=T), "\n", sep="", collapse=""))
        cat("\nThank you for providing the data!\n")

}
