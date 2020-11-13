prepareSql <-
function(dbms, ..., inputFile = NULL, outputFile = NULL) {
    parameter <- list(...)

    if(is.null(inputFile))
        stop("Please provide the SQL file!")

    if(is.null(outputFile))
        outputFile <- file.path(tempdir(), sprintf("ald_rendered_%s_%s.sql", gsub(" ", "_", dbms), make.names(parameter[["studyName"]])))

    parameterizedSql <- SqlRender::readSql(inputFile)

    renderedSql <- SqlRender::renderSql(parameterizedSql, cdmSchema = parameter$cdmSchema, ...)$sql

    translatedSql <- SqlRender::translateSql(renderedSql, targetDialect=dbms)$sql

    SqlRender::writeSql(translatedSql, outputFile)

    writeLines(paste("Created file '", outputFile, "'", sep = ""))

    outputFile
}
