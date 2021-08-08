# Source this file from PCAWG7 package root
cat(getwd(), "\n")

# Generate COSMIC v3.1 genome signatures
if (packageVersion("ICAMS") < '2.3.5') {
  remotes::install_github(repo = "steverozen/ICAMS", ref = "master")
  .rs.restartR()
}

# Generate COSMIC SBS96 signatures
SBS96.sigs.files <-
  list.files("data-raw/COSMIC.v3.1/data/SBS96/", full.names = TRUE)
SBS96.sigs.list <- lapply(SBS96.sigs.files, FUN = function(x){
  ICAMS::ReadCatalog(x, catalog.type = "counts.signature")[, 1, drop = FALSE]
})
stopifnot(all(sapply(SBS96.sigs.list, FUN = function(x) {
  grepl("GRCh37", colnames(x))
})))
SBS96.sigs.GRCh37 <- do.call(cbind, SBS96.sigs.list)
colnames(SBS96.sigs.GRCh37) <-
  gsub(pattern = "_GRCh37", replacement = "", x = colnames(SBS96.sigs.GRCh37))

SBS96.sigs.GRCh37.names.order <-
  paste0("SBS", c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                  11:16, paste0(17, letters[1:2]), 18:60, 84:90))
SBS96.sigs.GRCh37 <- SBS96.sigs.GRCh37[, SBS96.sigs.GRCh37.names.order, drop = FALSE]

# Adding necessary attributes
SBS96.sigs.GRCh37 <- ICAMS::as.catalog(SBS96.sigs.GRCh37, ref.genome = "GRCh37",
                                       catalog.type = "counts.signature",
                                       region = "genome")
attr(SBS96.sigs.GRCh37, "ref.genome") <- NULL

# attr(PCAWG7::signature$genome$SBS96, "class") does not have "array" because of
# older R version used when generating the data previously
testthat::expect_equivalent(SBS96.sigs.GRCh37[, colnames(PCAWG7::signature$genome$SBS96),
                                              drop = FALSE],
                            PCAWG7::signature$genome$SBS96, tolerance = 1e-3)

# Generate COSMIC SBS192 signatures
SBS192.sigs.files <-
  list.files("data-raw/COSMIC.v3.1/data/SBS192/", full.names = TRUE)
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

# Currently SBS84, SBS85, SBS86, SBS87, SBS89 does not have TSB signature
SBS192.sigs.GRCh37.names.order <-
  paste0("SBS", c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                  11:16, paste0(17, letters[1:2]), 18:60, 88, 90))
need.minus.E <-
  c("SBS23", "SBS25", "SBS27", "SBS29",
    "SBS42", "SBS45", "SBS46", "SBS59")
SBS192.sigs.GRCh37.names.order <-
  sapply(SBS192.sigs.GRCh37.names.order, FUN = function(x) {
    ifelse(x %in% need.minus.E, paste0(x, "-E"), x)})
SBS192.sigs.GRCh37 <-
  SBS192.sigs.GRCh37[, SBS192.sigs.GRCh37.names.order, drop = FALSE]
# attr(PCAWG7::signature$genome$SBS192, "class") does not have "array" because of
# older R version used when generating the data previously
testthat::expect_equivalent(SBS192.sigs.GRCh37[, colnames(PCAWG7::signature$genome$SBS192),
                                               drop = FALSE],
                            PCAWG7::signature$genome$SBS192)

# Generate COSMIC DBS78 signatures
DBS78.sigs.files <-
  list.files("data-raw/COSMIC.v3.1/data/DBS78/", full.names = TRUE)
DBS78.sigs.list <- lapply(DBS78.sigs.files, FUN = function(x){
  ICAMS::ReadCatalog(x, catalog.type = "counts.signature")[, 1, drop = FALSE]
})
stopifnot(all(sapply(DBS78.sigs.list, FUN = function(x) {
  grepl("GRCh37", colnames(x))
})))
DBS78.sigs.GRCh37 <- do.call(cbind, DBS78.sigs.list)
colnames(DBS78.sigs.GRCh37) <-
  gsub(pattern = "_GRCh37", replacement = "", x = colnames(DBS78.sigs.GRCh37))
DBS78.sigs.GRCh37.names.order <- paste0("DBS", 1:11)
DBS78.sigs.GRCh37 <-
  DBS78.sigs.GRCh37[, DBS78.sigs.GRCh37.names.order, drop = FALSE]
# Adding necessary attributes
DBS78.sigs.GRCh37 <- ICAMS::as.catalog(DBS78.sigs.GRCh37, ref.genome = "GRCh37",
                                       catalog.type = "counts.signature",
                                       region = "genome")
attr(DBS78.sigs.GRCh37, "ref.genome") <- NULL
# attr(PCAWG7::signature$genome$DBS78, "class") does not have "array" because of
# older R version used when generating the data previously
testthat::expect_equivalent(DBS78.sigs.GRCh37[, colnames(PCAWG7::signature$genome$DBS78),
                                              drop = FALSE],
                            PCAWG7::signature$genome$DBS78, tolerance = 1e-3)

# Generate COSMIC ID signatures
ID.sigs.files <-
  list.files("data-raw/COSMIC.v3.1/data/ID/", full.names = TRUE)
ID.sigs.list <- lapply(ID.sigs.files, FUN = function(x){
  ICAMS::ReadCatalog(x, catalog.type = "counts.signature")
})

ID.sigs.GRCh37 <- do.call(cbind, ID.sigs.list)
colnames(ID.sigs.GRCh37) <-
  gsub(pattern = "_GRCh37", replacement = "", x = colnames(ID.sigs.GRCh37))
ID.sigs.GRCh37.names.order <- paste0("ID", 1:18)
ID.sigs.GRCh37 <- ID.sigs.GRCh37[, ID.sigs.GRCh37.names.order, drop = FALSE]
attr(ID.sigs.GRCh37, "region") <- "genome"
# attr(PCAWG7::signature$genome$ID, "class") does not have "array" because of
# older R version used when generating the data previously
testthat::expect_equivalent(ID.sigs.GRCh37[, 1:17, drop = FALSE],
                            PCAWG7::signature$genome$ID)

# Put all the signatures inside a list
signature <- list()

signature$genome <- list(SBS96 = SBS96.sigs.GRCh37,
                                     SBS192 = SBS192.sigs.GRCh37,
                                     DBS78 = DBS78.sigs.GRCh37,
                                     ID = ID.sigs.GRCh37)


usethis::use_data(signature, overwrite = TRUE)
