exposure <- list()
exposure$PCAWG <- list()
exposure$TCGA <- list()
exposure$other.genome <- list()
exposure$other.exome <- list()

read.synapse.exposure <- function(filename) {
  tmp <- read.csv(file.path("data-raw/sig.profiler.exposures", filename))
  rownames(tmp) <- paste(tmp$Cancer.Types, tmp$Sample.Names, sep = "::")
  tmp <- tmp[ , -(1:3)]
  return(t(as.matrix(tmp)))
}

exposure$PCAWG$ID <-
  read.synapse.exposure("PCAWG_SigProfiler_ID_signatures_in_samples.csv")

exposure$PCAWG$SBS96 <-
  read.synapse.exposure("PCAWG_SigProfiler_SBS_signatures_in_samples.csv")

exposure$PCAWG$DBS78 <-
  read.synapse.exposure("PCAWG_SigProfiler_DBS_signatures_in_samples.csv")

exposure$TCGA$SBS96 <-
  read.synapse.exposure("TCGA_WES_sigProfiler_SBS_signatures_in_samples.csv")

exposure$TCGA$ID <-
  read.synapse.exposure("TCGA_WES_sigProfiler_ID_signatures_in_samples.csv")

exposure$other.genome$SBS96 <-
  read.synapse.exposure(
    "nonPCAWG_WGS_sigProfiler_SBS_signatures_in_samples_2018_04_13.csv")

exposure$other.exome$SBS96 <-
  read.synapse.exposure(
    "nonPCAWG_WES_sigProfiler_SBS_signatures_in_samples_2018_04_13.csv")

usethis::use_data(exposure, overwrite = TRUE)
