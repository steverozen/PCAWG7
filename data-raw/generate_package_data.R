library(ICAMS)

PCAWG.WGS.SBS.96 <- ICAMS::ReadCatalog("data-raw/WGS_PCAWG.96.csv", region = "genome")
class(PCAWG.WGS.SBS.96) <- "matrix"
usethis::use_data(PCAWG.WGS.SBS.96)

PCAWG.WGS.DBS <- ICAMS::ReadCatalog("data-raw/WGS_PCAWG.dinucs.csv", region = "genome")
class(PCAWG.WGS.DBS) <- "matrix"
usethis::use_data(PCAWG.WGS.DBS)

stopifnot(colnames(PCAWG.WGS.SBS.96) == colnames(PCAWG.WGS.DBS))
