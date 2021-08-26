# Source this file from PCAWG7 package root
cat(getwd(), "\n")

# Generate COSMIC v3.2 genome signatures
if (packageVersion("ICAMS") < '2.3.5') {
  remotes::install_github(repo = "steverozen/ICAMS", ref = "master")
  .rs.restartR()
}

library(ICAMS)

# Generate SBS96 signatures
SBS96.sigs.GRCh37 <-
  ICAMS::ReadCatalog(file = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_SBS_GRCh37.txt",
                     ref.genome = "GRCh37",
                     catalog.type = "counts.signature",
                     region = "genome")
attr(SBS96.sigs.GRCh37, "ref.genome") <- NULL

# Checking the difference with previous version of signatures
testthat::expect_equal(SBS96.sigs.GRCh37[, colnames(PCAWG7::signature$genome$SBS96),
                                         drop = FALSE],
                       PCAWG7::signature$genome$SBS96, tolerance = 1e-5)
