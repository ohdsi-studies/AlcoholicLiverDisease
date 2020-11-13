preparePopulationTable <-
function(df) {
    idx <- !is.na(df$DEATH_DATE)

    df$DEATH_OR_OP_END_DATE <- df$OBSERVATION_STOP
    df$DEATH_OR_OP_END_DATE[idx] <- df$DEATH_DATE[idx]

    df$TIME_TO_EVENT <- as.integer(difftime(df$DEATH_OR_OP_END_DATE, df$CONDITION_START, unit="days"))
    df$STATUS_ON_EVENT <- as.integer(!is.na(df$DEATH_DATE))

    check_population(df)

    return(df)
}
