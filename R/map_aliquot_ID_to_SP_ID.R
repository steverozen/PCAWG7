#' Translate aliquot IDs (e.g. e0fccaf5-925a-41f9-b87c-cd5ee4aecb59) to "SP" IDs (e.g. SP1682)
#'
#' @param aliquot.ids Character vector of aliquot IDs.
#'
#' @details If there are aliquot IDs that cannot be matched to any "SP" IDs,
#'   return NA with a warning.
#'
#' @export
#'
#' @return Character vector of corresponding "SP" IDs. If a corresponding
#' aliquot ID cannot be found, then return return NA with a warning.
#'
#' @note This function is mainly designed to translate the file names of PCAWG
#'   consensus callsets for SNV/Indel
#'   (https://dcc.icgc.org/api/v1/download?fn=/PCAWG/consensus_snv_indel/final_consensus_snv_indel_passonly_icgc.public.tgz)
#'
#' @examples
#' aliquot.ids <- c("e0fccaf5-925a-41f9-b87c-cd5ee4aecb59", "foo")
#' SP.ids <- map_aliquot_ID_to_SP_ID(aliquot.ids)
map_aliquot_ID_to_SP_ID <- function(aliquot.ids) {
  indices <- match(x = aliquot.ids, table = PCAWG7::PCAWG.sample.sheet$aliquot_id)
  SP.ids <- PCAWG7::PCAWG.sample.sheet$icgc_specimen_id[indices]
  indices.NA <- which(is.na(SP.ids))
  if (length(indices.NA) > 0) {
    warning("\nCannot find matching SP IDs for the following aliquot IDs\n",
            paste(aliquot.ids[indices.NA], collapse = " "),
            "\nReturning NA instead")
  }
  return(SP.ids)
}

