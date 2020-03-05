# Populate the package variable signatures.

require(ICAMS)

signature <- list()

signature$genome <- list()
signature$exome  <- list()

signature$genome$SBS192 <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_TSB_signatures.csv",
                     catalog.type = "counts.signature",
                     region = "transcript", # ref.genome = "hg19",
                     strict = FALSE,
                     ref.genome =
                       BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5)
attr(signature$genome$SBS192, "ref.genome") <- NULL


signature$genome$SBS96  <-
  ICAMS::ReadCatalog(
    "data-raw/sigProfiler_SBS_signatures_2019_05_22.csv",
    catalog.type = "counts.signature",
    region = "genome",
    ref.genome =
      BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5
  )
attr(signature$genome$SBS96, "ref.genome") <- NULL

signature$genome$DBS78    <-
  ICAMS::ReadCatalog("data-raw/sigProfiler_DBS_signatures.csv",
                     catalog.type = "counts.signature",
                     region = "genome", #, ref.genome = "hg19"
                     ref.genome =
                       BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5)
attr(signature$genome$DBS78, "ref.genome") <- NULL

# THIS FUNCTION IS FOR SIGNATURE ATTRIBUTIONS, NOT FOR SIGNATURES
# Need a custom read function for the indels
ReadPCAWG7ID <- function(file) {
  df <- read.csv(file)
  new.rownames <-
    apply(X = df[ , 1:4],
          MARGIN = 1,
          FUN = function(row) paste(unlist(row), collapse = ":"))
  stopifnot(new.rownames == ICAMS::catalog.row.order$ID)
  rownames(df) <- new.rownames
  df <- df[ , -(1:4)]
  return(df)
}

pre.id.cat <- read.csv("data-raw/sigProfiler_ID_signatures_fixed_rownames.csv")
rownames(pre.id.cat) <- pre.id.cat[ , 1]
pre.id.cat <- pre.id.cat[ , -1]
signature$genome$ID <-
  ICAMS::as.catalog(
    pre.id.cat,
    region = "genome",
    catalog.type = "counts.signature" #,
    # ref.genome =
      # BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5
      )
attr(signature$genome$ID, "ref.genome") <- NULL

exomes <- read.csv("data-raw/sigProfiler_exome_SBS_signatures.csv")
rownames(exomes) <- paste0(exomes$SubType, substr(exomes$Type, 3, 3))
exomes <- exomes[ , -(1:2)]
signature$exome$SBS96   <-
  ICAMS::as.catalog(exomes,
                     catalog.type = "counts.signature",
                     region = "exome",
                     ref.genome =
                       BSgenome.Hsapiens.1000genomes.hs37d5::BSgenome.Hsapiens.1000genomes.hs37d5)
attr(signature$exome$SBS96, "ref.genome") <- NULL

usethis::use_data(signature, overwrite = TRUE)
