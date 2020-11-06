#' Gather exposure statistics for one tumor type
#'
#' @keywords internal

ExposureStats1TumorType <- function(exposure) {
  present <- exposure > 0
  sig2proportion.present <- rowSums(present) / ncol(present)
  sig2is.present <- sig2proportion.present > 0
  sig2mean.of.those.present <-
    (rowSums(exposure) / ncol(exposure)) / sig2proportion.present

  summary <- lapply(1:nrow(exposure),
                    function(x) {
                      return(list(mean.of.present = sig2mean.of.those.present[x],
                                  proportion.present = sig2proportion.present[x])) })

  names(summary) <- rownames(exposure)
  summary <- summary[sig2is.present]

  return(summary)
}

if (FALSE) {
  xx <- ExposureStats1TumorType(PCAWG7::exposure$PCAWG$SBS96)

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
