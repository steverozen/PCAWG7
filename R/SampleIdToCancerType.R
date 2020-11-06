#' Split out the cancer type from the sample ID for PCAWG IDs
#'
#' @param PCAWGID A character vector of PCAWG IDs of the form
#'    <cancer.type>::<sample.id>.
#'
#' @return A character vector parallel to \code{PCAWGID} containing
#'   only the <cancer.type> strings.
#'
#' @export

SampleIDToCancerType <- function(PCAWGID) {
  tumor.types <- sapply(
    PCAWGID,
    function(x) {strsplit(x, split = "::", fixed = T)[[1]][1]})

  return(tumor.types)
}

SplitExposureByTumorType <- function(exposure, tumor.type) {
  tt <- t(exposure)
  split.tt <- split(as.data.frame(tt), tumor.type)
  rr <- lapply(split.tt, t)
  return(rr)
}
