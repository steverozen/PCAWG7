exposure <- list()
exposure$PCAWG <- list()
tmp <- read.csv("data-raw/sig.profiler.exposures/PCAWG_SigProfiler_ID_signatures_in_samples.csv")
colnames(tmp)
rownames(tmp) <- paste(tmp$Cancer.Types, tmp$Sample.Names, sep = "::")
tmp <- tmp[ , -(1:3)]
tmp <- t(as.matrix(tmp))
exposure$PCAWG$ID <- tmp
usethis::use_data(exposure, overwrite = TRUE)
