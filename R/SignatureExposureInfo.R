#' Gather exposure statistics for one tumor type
#'
#' @keywords internal

ExposureStats1TumorType <- function(exposure) {
  present <- exposure > 0
  proportion.present <- rowSums(present) / ncol(present)
  is.present <- proportion.present > 0
  mean.of.those.present <-
    (rowSums(exposure) / ncol(exposure)) / proportion.present

  summary <- lapply(1:nrow(exposure),
                    function(x) {
                      return(list(mean.of.present = mean.of.those.present[x],
                                  proportion.present = proportion.present[x])) })

  tt <- matrix(unlist(summary, recursive = FALSE), ncol = 2, byrow = TRUE)

  rownames(tt) <- rownames(exposure)
  colnames(tt) <- c("mean.of.those.present", "proportion.present")
  tt <- tt[is.present, , drop = FALSE]
  return(tt)
}

GatherPCAWG7ExposureStats <- function() {
  PCAWG.SBS96 <-
    SplitPCAWGMatrixByTumorType(PCAWG7::exposure$PCAWG$SBS96)

  if (FALSE) {
    other.genome.SBS96 <-
      SplitPCAWGMatrixByTumorType(PCAWG7::exposure$other.genome$SBS96)
    TCGA.SBS96 <-
      SplitPCAWGMatrixByTumorType(PCAWG7::exposure$TCGA$SBS96)
    other.exome.SBS96 <-
      SplitPCAWGMatrixByTumorType(PCAWG7::exposure$other.exome$SBS96)
  }

  PCAWG.DBS78 <- SplitPCAWGMatrixByTumorType(PCAWG7::exposure$PCAWG$DBS78)

  PCAWG.ID <- SplitPCAWGMatrixByTumorType(PCAWG7::exposure$PCAWG$ID)


  exposure.stats <- list()
  exposure.stats$PCAWG$SBS96 <- lapply(PCAWG.SBS96, ExposureStats1TumorType)
  exposure.stats$PCAWG$DBS78 <- lapply(PCAWG.DBS78, ExposureStats1TumorType)
  exposure.stats$PCAWG$ID    <- lapply(PCAWG.ID,    ExposureStats1TumorType)

  usethis::use_data(exposure.stats, overwrite = TRUE)
}
