exportFromDB <-
function(conn, tableIdentifier, dbms, ...) {

    params <- list(...)

    tableName <- sprintf("#%s_%s_%s", params$sourceName, params$studyName, tableIdentifier)
    path <- file.path(tempdir(), "permitted-files", params$studyName, params$sourceName)

    parameterizedSql <- sprintf("SELECT * FROM %s", tableName)

    renderedSql <- SqlRender::renderSql(parameterizedSql)$sql

    translatedSql <- SqlRender::translateSql(renderedSql, targetDialect=dbms)$sql

    data <- DatabaseConnector::querySql(conn, translatedSql)

    if(!dir.exists(path)) dir.create(path, recursive=T, showWarnings=F)

    cat(sprintf("Export table \"%s\"\n", tableName))

    write.table(data, file.path(path, sprintf("%s.csv", tableIdentifier)), quote=T, sep="\t", row.names=FALSE, na="")

    invisible(data)

}
