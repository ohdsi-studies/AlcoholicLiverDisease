getIDColName <- function(df, ID_Template="PERSON_ID") {
	return(colnames(df)[grep(ID_Template, colnames(df), ignore.case=T)])
}
