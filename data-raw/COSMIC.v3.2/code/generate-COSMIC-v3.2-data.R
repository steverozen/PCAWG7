# Source this file from PCAWG7 package root
cat(getwd(), "\n")
source("data-raw/COSMIC.v3.2/code/generate-COSMIC-v3.2-genome-sigs.R")
source("data-raw/COSMIC.v3.2/code/generate-COSMIC-v3.2-etiologies.R")

COSMIC.v3.2 <- list()
COSMIC.v3.2$signature <- signature
COSMIC.v3.2$etiologies <- etiologies
usethis::use_data(COSMIC.v3.2, overwrite = TRUE)
