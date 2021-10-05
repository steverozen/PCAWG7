#' Extract tumor type from column names and return the input matrix split by
#' tumor type based on the PCAWG <tumor_type>::<sample_id> convention
#'
#' @param M A numerical matrix or data frame or
#'   \code{\link[ICAMS]{ICAMS}} catalog in which
#'   columns are samples (e.g. tumors) and rows are either
#'   mutational signatures (for exposures) or mutation types (for
#'   spectra), and each element is the number of mutations due
#'   to a given mutational
#'   signature or mutation type in a single sample.
#'   The column names must be of the the form
#'   <cancer.type>::<sample.ID>.
#'
#' @return Invisibly, the list of exposure matrices or
#'    \code{\link[ICAMS]{ICAMS}} catalogs created by splitting
#'   \code{matrix} by the tumor type encoded in the column names.
#'
#' @examples
#' \dontrun{
#' mm <- SplitPCAWGMatrixByTumorType(spectra$PCAWG$DBS78)
#' }
#' @export
#'
SplitPCAWGMatrixByTumorType <- function(M) {
  tumor.type <-  PCAWG7::SampleIDToCancerType(colnames(M))
  invisible(SplitMatrixBySampleType(M, tumor.type))
}
