#' Translate TCGA (The Cancer Genome Atlas) IDs to ICGC (International Cancer
#' Genome Consortium) IDs
#'
#' @param tcga.ids Character vector of TCGA IDs.
#'
#' @details If there are TCGA IDs that cannot be matched to any ICGC IDs,
#'   return NA with a warning.
#'
#' @export
#'
#' @return Character vector of corresponding ICGC IDs. If a corresponding ICGC
#'   ID cannot be found, then return NA with a warning.
#'
#' @examples
#' \dontrun{
#' tcga.ids <- c("TCGA-AA-A01V", "foo", "TCGA-CA-6717", "bar")
#' icgc.ids <- TCGA_ID_to_ICGC_ID(tcga.ids)
#' icgc.ids <- icgc.ids[nzchar(icgc.ids)]
#' }
TCGA_ID_to_ICGC_ID <- function(tcga.ids) {
  indices <- match(x = tcga.ids, table = TCGA.ICGC.IDs$tcga_id)
  icgc.ids <- TCGA.ICGC.IDs$icgc_specimen_id[indices]
  indices.NA <- which(is.na(icgc.ids))
  if (length(indices.NA) > 0) {
    warning("\nCannot find matching ICGC IDs for the following TCGA IDs\n",
            paste(tcga.ids[indices.NA], collapse = " "),
            "\nReturning NA instead")
  }
  return(icgc.ids)
}
