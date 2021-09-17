#' Given PCAWG "SP" IDs (e.g. SP123958) return either the "full" IDs (Kidney-ChRCC::SP123958) or just the tumor type (Kidney-ChRCC)
#'
#' @param SP.IDs A character vector of PCAWG "SP" IDs.
#'
#' @param merge If \code{TRUE} return a parallel vector of <tumor_type>::<SP_ID>; otherwise just <tumor_type>.
#'
#' @details Fails with an "subscript out of bounds" error if any of the elements of \code{SP.IDs} is unknown.
#'
#' @export
#'
#' @examples
#' map_SP_ID_to_tumor_type(c("SP123958", "SP43633"))
#' map_SP_ID_to_tumor_type(c("SP123958", "SP43633"), merge = FALSE)

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
