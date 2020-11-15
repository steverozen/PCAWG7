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
  tt <- tt[is.present, ]
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


if (FALSE) {

    all.types <-
    lapply(list(PCAWG.SBS96 # ,
                # other.genome.SBS96,
                # TCGA.SBS96,
                #other.exome.SBS96
                ), names)

  all.types <- unique(unlist(all.types))
}



if (FALSE) {
  # Maybe add exome info

  TCGA.ID  <- SplitPCAWGMatrixByTumorType(PCAWG7::exposure$TCGA$ID)

  rr<- sum(ICAMS::all.abundance$BSgenome.Hsapiens.1000genomes.hs37d5$genome$`96`) /
    sum(ICAMS::all.abundance$BSgenome.Hsapiens.1000genomes.hs37d5$exome$`96`)


  lad <- cbind(PCAWG.SBS96[["Lung-AdenoCA"]],
               TCGA.SBS96$`Lung-AdenoCa` * rr,
               other.genome.SBS96$`Lung-AdenoCa`,
               other.exome.SBS96$`Lung-AdenoCa` * rr)

  ladx <- ExposureStats1TumorType(lad)

}

if (FALSE) {

  xx <- ExposureStats1TumorType(by.type[[1]])

CancerTypeToExposureStatData <- function() {
  exposure <- PCAWG7::exposure$PCAWG$SBS96
  tumor.type <- SampleIDToCancerType(colnames(exposure))
  split.exposure <-
    SplitExposureByTumorType(exposure, tumor.type)
  rr <- lapply(split.exposure, ExposureStats1TumorType)
  return(do.call("cbind", rr))
}

PCAWG.platinum.present.by.sig <- CancerTypeToExposureStatData()

CancerTypeToSigNames <- function(ca.type) {
  rr <- rownames(
    PCAWG.platinum.present.by.sig[PCAWG.platinum.present.by.sig[ , ca.type], ])
  return(rr)
}

CancerTypeToSigSubset <- function(ca.type) {
  rname <- CancerTypeToSigNames(ca.type)
  return(PCAWG7::signature$genome$SBS96[ , rname])
}

CancerTypeToSigNames("Biliary-AdenoCA")

mysigs <- CancerTypeToSigSubset("Biliary-AdenoCA")

mysigs2 <- mysigs[ , rownames(exposures)]

foo3 <- mSigAct::AnySigSubsetPresent(spect = catSBS96.1, all.sigs = mysigs2,
                                     Ha.sigs.indices = c(4, 6, 7, 8, 9, 10, 11),
                                     m.opts = mSigAct::DefaultManyOpts())

}
