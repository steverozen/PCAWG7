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


# SBS10c, SBS10d, SBS91, SBS92, SBS93, SBS94 (total 6) new SBS signatures
# were added in COSMIC v3.2
# See the news from COSMIC release for more details
# https://cosmic-blog.sanger.ac.uk/cosmic-mutational-signatures-release-v3-2/
setdiff(colnames(SBS96.sigs.GRCh37), colnames(PCAWG7::signature$genome$SBS96))

# Checking the difference with previous version of signatures
testthat::expect_equal(SBS96.sigs.GRCh37[, colnames(PCAWG7::signature$genome$SBS96),
                                         drop = FALSE],
                       PCAWG7::signature$genome$SBS96, tolerance = 1e-5)

# Generate DBS78 signatures
DBS78.sigs.GRCh37 <-
  ICAMS::ReadCatalog(file = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_DBS_GRCh37.txt",
                     ref.genome = "GRCh37",
                     catalog.type = "counts.signature",
                     region = "genome")
attr(DBS78.sigs.GRCh37, "ref.genome") <- NULL

# Checking the difference with previous version of signatures
testthat::expect_equal(DBS78.sigs.GRCh37[, colnames(PCAWG7::signature$genome$DBS78),
                                         drop = FALSE],
                       PCAWG7::signature$genome$DBS78)

# Generate ID signatures
ID.sigs.GRCh37 <-
  ICAMS::ReadCatalog(file = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_ID_GRCh37.txt",
                     ref.genome = "GRCh37",
                     catalog.type = "counts.signature",
                     region = "genome")
attr(ID.sigs.GRCh37, "ref.genome") <- NULL

# Checking the difference with previous version of signatures
testthat::expect_equal(ID.sigs.GRCh37[, colnames(PCAWG7::signature$genome$ID),
                                         drop = FALSE],
                       PCAWG7::signature$genome$ID, tolerance = 1e-6)

# Generate SBS192 signatures
SBS192.sigs.files <-
  list.files("data-raw/COSMIC.v3.2/data/SBS192/", full.names = TRUE)
stopifnot(length(SBS192.sigs.files) == 70)
SBS192.sigs.list <- lapply(SBS192.sigs.files, FUN = function(x){
  ICAMS::ReadCatalog(x, catalog.type = "counts.signature",
                     ref.genome = "GRCh37",
                     region = "transcript")
})
stopifnot(all(sapply(SBS192.sigs.list, FUN = function(x) {
  grepl("GRCh37", colnames(x))
})))
SBS192.sigs.GRCh37 <- do.call(cbind, SBS192.sigs.list)
attr(SBS192.sigs.GRCh37, "ref.genome") <- NULL

colnames(SBS192.sigs.GRCh37) <-
  gsub(pattern = "_GRCh37", replacement = "", x = colnames(SBS192.sigs.GRCh37))
colnames(SBS192.sigs.GRCh37) <-
  gsub(pattern = ".E", replacement = "-E", x = colnames(SBS192.sigs.GRCh37))

# Currently SBS10c, SBS10d, SBS84, SBS85, SBS86, SBS87, SBS89, SBS91 (total 8)
# does not have TSB signature
SBS192.sigs.GRCh37.names.order <-
  paste0("SBS", c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                  11:16, paste0(17, letters[1:2]), 18:60, 88, 90, 92:94))
need.minus.E <-
  c("SBS23", "SBS25", "SBS27", "SBS29",
    "SBS42", "SBS45", "SBS46", "SBS59")
SBS192.sigs.GRCh37.names.order <-
  sapply(SBS192.sigs.GRCh37.names.order, FUN = function(x) {
    ifelse(x %in% need.minus.E, paste0(x, "-E"), x)})
SBS192.sigs.GRCh37 <-
  SBS192.sigs.GRCh37[, SBS192.sigs.GRCh37.names.order, drop = FALSE]

# Checking the difference with previous version of signatures
testthat::expect_equal(SBS192.sigs.GRCh37[, colnames(PCAWG7::signature$genome$SBS192),
                                          drop = FALSE],
                       PCAWG7::signature$genome$SBS192)

# Put all the signatures inside a list
signature <- list()

signature$genome <- list(SBS96 = SBS96.sigs.GRCh37,
                         SBS192 = SBS192.sigs.GRCh37,
                         DBS78 = DBS78.sigs.GRCh37,
                         ID = ID.sigs.GRCh37)


usethis::use_data(signature, overwrite = TRUE)
