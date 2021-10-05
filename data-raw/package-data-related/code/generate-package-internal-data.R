# Source this file from PCAWG7 package root

cat(getwd(), "\n")

source("data-raw/package-data-related/code/convert-tcga_id-to-icgc_specimen_id.R")
source("data-raw/package-data-related/code/create-sigs-etiology-data.R")

usethis::use_data(TCGA.ICGC.IDs,
                  internal = TRUE, overwrite = TRUE)

