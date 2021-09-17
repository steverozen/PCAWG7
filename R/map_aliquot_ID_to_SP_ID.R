#' Translate aliquot IDs (e.g. e0fccaf5-925a-41f9-b87c-cd5ee4aecb59) to "SP" IDs (e.g. SP1682)
#'
#' @param aliquot.ids Character vector of aliquot IDs.
#'
#' @export
#'
#' @return Character vector of corresponding "SP" IDs. If a corresponding
#' aliquot ID cannot be found, then return an empty string.
#'
#' @examples
#' aliquot.ids <- c("e0fccaf5-925a-41f9-b87c-cd5ee4aecb59", "foo")
#' SP.ids <- map_aliquot_ID_to_SP_ID(aliquot.ids)
map_aliquot_ID_to_SP_ID <- function(aliquot.ids) {
  aliquot.ids.full <- PCAWG7::PCAWG.sample.sheet$aliquot_id
  SP.ids <- sapply(aliquot.ids, function(aliquot.id) {
    if (any(grepl(aliquot.id, aliquot.ids.full))) {
      indices <- grep(aliquot.id, aliquot.ids.full)
      return(unique(PCAWG7::PCAWG.sample.sheet[indices, "icgc_specimen_id"]))
    } else {
      return("")
    }})
  return(SP.ids)
}
