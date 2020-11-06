#' Split an exposure matrix into a list of matrices, each for a single tumor type.
#'
#' @param exposure A numerical matrix or data frame in which rows are
#'   mutational signature and columns are samples (e.g. tumors), and
#'   each element is the number of mutations due to a given mutational
#'   signature in a single sample.
#'
#' @param tumor.type A charactor or numeric vector, each element
#'   of which indicates a particular tumor type.
#'
#' @return The list of exposure matrices created by splitting
#'   \code{exposure} by \code{tumor.type}.
#'
#' @export
#'
SplitExposureByTumorType <- function(exposure, tumor.type) {
  tt <- t(exposure)
  split.tt <- split(as.data.frame(tt), tumor.type)
  rr <- lapply(split.tt, t)
  return(rr)
}
