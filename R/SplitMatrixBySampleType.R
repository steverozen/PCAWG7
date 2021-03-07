#' Split an exposure matrix or spectrum matrix into a list of matrices, each for a single tumor type.
#'
#' @inheritParams SplitPCAWGMatrixByTumorType
#'
#' @param sample.type A character or numeric vector, each element
#'   of which indicates a particular sample type.
#'
#' @return Invisibly, the list of exposure or spectrum
#'   matrices created by splitting
#'   \code{M} by \code{sample.type}.
#'
#' @export
#'
SplitMatrixBySampleType <- function(M, sample.type) {
  split.tt <- split(as.data.frame(t(M)), sample.type)
  M.catalog.type <- attr(M, "catalog.type")
  if (is.null(M.catalog.type)) {
    rr <- lapply(split.tt, t)
  } else {
    M.region     <- attr(M, "region")
    M.ref.genome <- attr(M, "ref.genome")
    M.abundance  <- attr(M, "abundance")
    rr <- lapply(split.tt,
                 function(rrr) {
                   rrr <- t(rrr)
                   return(ICAMS::as.catalog(
                     rrr,
                     ref.genome   = M.ref.genome,
                     region       = M.region,
                     catalog.type = M.catalog.type,
                     abundance    = M.abundance))
                 })
  }
  invisible(return(rr))
}

#' Extract tumor type from column names and return the input matrix split by tumor type.
#'
#' @param M A numerical matrix or data frame in which
#'   columns are samples (e.g. tumors) and rows are either
#'   mutational signatures (for exposures) or mutation types (for
#'   spectra), and, each element is the number of mutations due
#'   to a given mutational
#'   signature or mutation type in a single sample.
#'
#' @return Invisibly, the list of exposure matrices created by splitting
#'   \code{matrix} by the tumor type encoded in the column names.
#'
#' @export
#'
SplitPCAWGMatrixByTumorType <- function(M) {
  tumor.type <-  PCAWG7::SampleIDToCancerType(colnames(M))
  invisible(return(SplitMatrixBySampleType(M, tumor.type)))
}
