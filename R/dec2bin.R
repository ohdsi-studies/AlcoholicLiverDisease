dec2bin <- function(x, n) {
        as.integer(rev(intToBits(x)[1:n]))
}


