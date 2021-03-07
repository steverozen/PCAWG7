#' Get the proposed etiology of a signature
#'
#' @param mutation.type character string, one of SBS96, SBS192, DBS78, ID
#'
#' @param sig.id character vector with signature signature ids, e.g.
#'    \code{c("SBS3", "foo")}.
#'
#' @return A character vector of the same length as \code{sig.id},
#' each element of which is the etiology of the
#' corresponding signature, if known, or else the empty string.
#'
#' @examples
#' GetEtiology("ID", c("ID1", "foo", "ID3"))
#'
#' @export


GetEtiology <- function(mutation.type, sig.id) {
  legal <- c("SBS96", "SBS192", "DBS78", "ID")
  if (!mutation.type %in% legal) {
    stop("GetEtiology: mutation.type must be one of ",
         paste(legal, collapse = ""))
  }
  mm <- sigs.etiologies[[mutation.type]]
  rr <- sapply(sig.id,
               function(one.id) {
                 if (one.id %in% rownames(mm)) {
                   return(mm[one.id, ])
                 } else {
                   return("")
                 }},
               USE.NAMES = TRUE,
               simplify = TRUE)
  return(rr)
}
