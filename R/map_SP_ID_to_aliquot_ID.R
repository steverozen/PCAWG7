#' Translate "SP" IDs (e.g. SP1682) to aliquot IDs (e.g. e0fccaf5-925a-41f9-b87c-cd5ee4aecb59)
#'
#' @param SP.ids Character vector of "SP" IDs.
#'
#' @details If there are SP IDs that cannot be matched to any aliquot IDs,
#'   return NA with a warning.
#'
#' @export
#'
#' @return Character vector of corresponding aliquot IDs. If a corresponding
#' SP ID cannot be found, return NA with a warning.
#'
#' @examples
#' SP.ids <- c("SP58101", "foo")
#' aliquot.ids <- map_SP_ID_to_aliquot_ID(SP.ids)
map_SP_ID_to_aliquot_ID <- function(SP.ids) {
  indices <- match(x = SP.ids, table = PCAWG7::PCAWG.sample.sheet$icgc_specimen_id)
  aliquot.ids <- PCAWG7::PCAWG.sample.sheet$aliquot_id[indices]
  indices.NA <- which(is.na(aliquot.ids))
  if (length(indices.NA) > 0) {
    warning("\nCannot find matching aliquot IDs for the following SP IDs\n",
            paste(SP.ids[indices.NA], collapse = " "),
            "\nReturning NA instead")
  }
  return(aliquot.ids)
}
