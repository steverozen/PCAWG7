catSBS96.1 <- PCAWG7::spectra$PCAWG$SBS96[, 1, drop = FALSE]

SampleIDToCancerType <- function(PCAWGID) {
  tumor.types <- sapply(
    PCAWGID,
    function(x) {strsplit(x, split = "::", fixed = T)[[1]][1]})
  
  return(tumor.types)
}

SplitExposureByTumorType <- function(exposure, tumor.type) {
  tt <- t(exposure)
  split.tt <- split(as.data.frame(tt), tumor.type)
  rr <- lapply(split.tt, t)
  return(rr)
}


ExposureStats1TumorType <- function(exposure) {
  count.by.sig <- rowSums(exposure) 
  present.by.sig <- count.by.sig > 0
  
  return(present.by.sig)
}

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



exposures <- GetExposureWithConfidence(catalog = catSBS96.1, 
                                       # sig.universe = PCAWG7::signature$genome$SBS96, 
                                       sig.universe = CancerTypeToSigSubset("Biliary-AdenoCA"),
                                       num.of.replicates = 100, 
                                       conf.int = 0.95,
                                       method = decomposeQP) 

mysigs2 <- mysigs[ , rownames(exposures)]

foo3 <- mSigAct::AnySigSubsetPresent(spect = catSBS96.1, all.sigs = mysigs2, 
                                     Ha.sigs.indices = c(4, 6, 7, 8, 9, 10, 11), 
                                     m.opts = mSigAct::DefaultManyOpts())

exposure1 <- GetExposureAndPlotToPdf(catalog = catSBS96.1, 
                                     # file = file.path(tempdir(), "test.pdf"),
                                     file = "test.pdf",
                                     sig.universe = PCAWG7::signature$genome$SBS96, 
                                     num.of.replicates = 100, 
                                     method = decomposeQP) 