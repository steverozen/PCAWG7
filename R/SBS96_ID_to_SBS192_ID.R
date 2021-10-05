#' Translate SBS96 signature IDs to SBS192 signature IDs by adding "-E" if necessary
#'
#' @param sig.ids Character vector of SBS96 signature IDs.
#'
#' @export
#' @return Character vector of corresponding SBS192 signature IDs; some
#'   have "-E" (for exome) post-pended.
#'
#' @examples
#' SBS96.ids <- c("SBS1", "SBS23", "SBS25")
#' SBS192.ids <- SBS96_ID_to_SBS192_ID(SBS96.ids)
SBS96_ID_to_SBS192_ID <- function(sig.ids) {
  need.minus.E <-
    c("SBS23", "SBS25", "SBS27", "SBS29",
      "SBS42", "SBS45", "SBS46", "SBS59")
  rr <- lapply(sig.ids,
               function(x) ifelse(x %in% need.minus.E, paste0(x, "-E"), x))
  return(unlist(rr))
}
