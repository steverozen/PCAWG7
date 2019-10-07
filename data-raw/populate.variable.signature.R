# Populate the package variable signatures.

require(ICAMS)

signature <- list()

signature$genome <- list()
signature$exome  <- list()

signature$genome$SBS192 <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_TSB_signatures.csv",
                     region = "transcript", ref.genome = "hg19",
                     strict = FALSE)

signature$genome$SBS96  <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_SBS_signatures_2019_05_22.csv",
                     region = "genome", ref.genome = "hg19")

signature$genome$DBS    <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_DBS_signatures.csv",
                     region = "genome", ref.genome = "hg19")

# Need to reformat file or use a custom read function
# signature$genome$ID     <-
#   ICAMS::ReadCatalog("data-raw/sigProfiler_ID_signatures.csv",
#                     region = "genome", ref.genome = "hg9")

signature$exome$SBS96   <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_exome_SBS_signatures.csv",
                     region = "exome", ref.genome = "hg19")

usethis::use_data(signature, overwrite = TRUE)

