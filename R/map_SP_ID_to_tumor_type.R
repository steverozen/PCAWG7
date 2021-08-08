map_SP_ID_to_tumor_type <- function(SP.IDs, merge = TRUE) {
  cc <- colnames(PCAWG7::spectra$PCAWG$SBS96)
  zz <- strsplit(cc, "::", fixed = TRUE)
  tt <- t(matrix(unlist(zz), nrow = 2))
  rownames(tt) <- tt[ , 2, drop = FALSE]
  rr <- tt[SP.IDs, ]
  if (merge) {
    return(apply(rr, MARGIN = 1, paste, collapse = "::"))
  } else {
    return(rr[ , 1, drop = TRUE])
  }
}

if (FALSE) {
  map_SP_ID_to_tumor_type(c("SP123958", "SP43633"))

}
