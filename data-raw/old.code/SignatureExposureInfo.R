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
