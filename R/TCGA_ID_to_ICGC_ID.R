#' Translate TCGA(The Cancer Genome Atlas) IDs to ICGC(International Cancer
#' Genome Consortium) IDs
#'
#' @param tcga.ids Character vector of TCGA IDs.
#'
#' @export
#'
#' @return Character vector of corresponding ICGC IDs. If a corresponding
#' ICGC ID cannot be found, then return an empty string.
#'
#' @examples
#' tcga.ids <- c("TCGA-AA-A01V", "foo", "TCGA-CA-6717", "bar")
#' icgc.ids <- TCGA_ID_to_ICGC_ID(tcga.ids)
#' icgc.ids <- icgc.ids[nzchar(icgc.ids)]
TCGA_ID_to_ICGC_ID <- function(tcga.ids) {
  tcga.ids.full <- TCGA.ICGC.IDs$tcga_id
  icgc.ids <- sapply(tcga.ids, function(tcga.id) {
    if (any(grepl(tcga.id, tcga.ids.full))) {
      indices <- grep(tcga.id, tcga.ids.full)
      return(unique(TCGA.ICGC.IDs[indices, "icgc_specimen_id"]))
    } else {
      return("")
    }})
  return(icgc.ids)
}
