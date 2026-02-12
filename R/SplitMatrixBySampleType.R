#' Split an exposure matrix or spectrum matrix into a list of matrices, each for a single sample type
#'
#' @param M A numerical matrix or data frame in which
#'   columns are samples (e.g. tumors) and rows are either
#'   mutational signatures (for exposures) or mutation types (for
#'   spectra), and, each element is the number of mutations due
#'   to a given mutational
#'   signature or mutation type in a single sample
#'
#' @param sample.type A character or numeric vector, each element
#'   of which indicates a particular sample type.
#'
#' @return Invisibly, the list of exposure or spectrum
#'   matrices created by splitting
#'   \code{M} by \code{sample.type}.
#'
#' @examples
#' ff <- matrix(1, nrow=3, ncol = 2)
#' colnames(ff) <- c("sample1", "sample2")
#' xx <- SplitMatrixBySampleType(ff, c("sample.type.x", "sample.type.y"))
#' xx
#'
#' @export
#'
SplitMatrixBySampleType <- function(M, sample.type) {
  extra.attrs <- attributes(M)
  extra.attrs[c("dim", "dimnames")] <- NULL
  split.tt <- split(as.data.frame(t(M)), sample.type)
  rr <- lapply(split.tt, function(rrr) {
    rrr <- t(rrr)
    for (a in names(extra.attrs)) {
      attr(rrr, a) <- extra.attrs[[a]]
    }
    rrr
  })
  invisible(rr)
}
