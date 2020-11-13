survival_analysis <-
function(group, population, descr="REPLACE", path="", con=stdout()) {

    tryCatch({
            group <- group[match(population$PERSON_ID, names(group))]
            if (length(unique(group)) > 1) {
	            population <- cbind(population, GROUP=group)

	            col <- group
	            levels(col) <- colorRampPalette(c("red", "blue"))(length(levels(col)))
    
	            sdiff <- survdiff(Surv(TIME_TO_EVENT, STATUS_ON_EVENT) ~ GROUP, data=population)
	            sfit <- survfit(Surv(TIME_TO_EVENT, STATUS_ON_EVENT) ~ GROUP, data=population)
		    pval <- signif(1 - pchisq(sdiff$chisq, 1))

	            print(sprintf("descr: %s\t---\t p-value: %.3f", descr, signif(1 - pchisq(sdiff$chisq, 1))))

		    if(!dir.exists(file.path(tempdir(), path))) dir.create(file.path(tempdir(), path), recursive=TRUE, showWarnings=F)

	            jpeg(file.path(tempdir(), path, sprintf("survival-%s.jpg", descr)), width=8, height=6, units='in', res=300)

	            plot(sfit, mark.time=T, axes=F, main=descr, xlab="Time in days", col=levels(col))
	            axis(1)
	            axis(2, las=2)

		    legend("bottomright", legend=levels(group), fill=levels(col), inset=c(0,0.96), xpd=TRUE, horiz=TRUE, bty="n" )

	            legend("bottomright", legend=sprintf("Log-rank p: %.3f", pval), bty="n")
	            dev.off()

	            writeLines(paste(c(descr, sdiff$n, sdiff$obs, sdiff$exp, pval), sep="\t", collapse="\t"), con=con)
    
	            list(sdiff, sfit)
	    } else {
		    writeLines(paste(c(descr, as.vector(table(group)), NA), collapse="\t"), con=con)
	    }
	}, error=function(e) {
		if(!dir.exists(file.path(tempdir(), path))) dir.create(file.path(tempdir(), path), recursive=TRUE, showWarnings=F)
		writeLines(as.character(e), file.path(tempdir(), path, sprintf("error-survival-%s.txt", descr)))
		writeLines(paste(c(descr, NA), collapse="\t"), con=con)
	}
    )
}
