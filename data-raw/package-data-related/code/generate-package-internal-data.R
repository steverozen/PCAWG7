# Source this file from PCAWG7 package root

cat(getwd(), "\n")

source("data-raw/package-data-related/code/convert-tcga_id-to-icgc_specimen_id.R")

usethis::use_data(TCGA.ICGC.IDs,
                  internal = TRUE, overwrite = TRUE)

