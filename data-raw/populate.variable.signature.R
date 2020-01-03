# Populate the package variable signatures.

require(ICAMS)

signature <- list()

signature$genome <- list()
signature$exome  <- list()

signature$genome$SBS192 <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_TSB_signatures.csv",
                     catalog.type = "counts.signature",
                     region = "transcript", # ref.genome = "hg19",
                     strict = FALSE)

signature$genome$SBS96  <-
  ICAMS::ReadCatalog(
    "data-raw/sigProfiler_SBS_signatures_2019_05_22.csv",
    catalog.type = "counts.signature",
    region = "genome",
    ref.genome =
      BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5
  )

signature$genome$DBS    <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_DBS_signatures.csv",
                     catalog.type = "counts.signature",
                     region = "genome" #, ref.genome = "hg19"
                     )

# Need a custom read function for the indels.
ReadPCAWG7ID <- function(file) {
  df <- read.csv("data-raw/WGS_PCAWG.indels.csv")
  new.rownames <-
    apply(X = df[ , 1:4],
          MARGIN = 1,
          FUN = function(row) paste(unlist(row), collapse = ":"))
  stopifnot(new.rownames == ICAMS::catalog.row.order$ID)
  rownames(df) <- new.rownames
  df <- df[ , -(1:4)]
  return(df)
}

signature$genome$ID <-
  ICAMS::as.catalog(
    ReadPCAWG7ID("data-raw/sigProfiler_ID_signatures.csv"),
    region = "genome",
    catalog.type = "counts.signature",
    ref.genome =
      BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5)

signature$exome$SBS96   <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_exome_SBS_signatures.csv",
                     catalog.type = "counts.signature",
                     region = "exome" #, ref.genome = "hg19"
  )

usethis::use_data(signature, overwrite = TRUE)
