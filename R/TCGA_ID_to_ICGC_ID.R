#' Translate SBS96 signature IDs to SBS192 signature IDs by adding "-E" if necessary.
#'
#' @param tcga.ids Character vector of TCGA IDs.
#'
#' @export
#'
#' @return Character vector of corresponding SBS192 signature IDs; some
#'   have "-E" (for exome) post-pended.
#'
#' @examples
#' SBS96.ids <- c("SBS1", "SBS23", "SBS25")
#' SBS192.ids <- SBS96_ID_to_SBS192_ID(SBS96.ids)
TCGA_ID_to_ICGC_ID <- function(tcga.ids) {

  tcga.ids.full <- TCGA.ICGC.IDs$tcga_id
  icgc.ids <- sapply(tcga.ids, function(tcga.id) {
    if (tcga.id %in% tcga.ids.full) {
      return(TCGA.ICGC.IDs[tcga.id, "icgc_specimen_id"])
    } else {
      return("")
    }})
  return(icgc.ids)
}
