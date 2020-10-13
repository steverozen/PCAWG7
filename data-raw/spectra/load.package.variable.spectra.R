library(ICAMS)
library(BSgenome.Hsapiens.1000genomes.hs37d5)

spectra <- list()
spectra$PCAWG <- list()
spectra$TCGA <- list()
spectra$other.genome <- list()
spectra$other.exome <- list()

rr <- function(filename, region) {
  cc <- ICAMS::ReadCatalog(
    file.path("data-raw/spectra", filename),
    ref.genome = BSgenome.Hsapiens.1000genomes.hs37d5,
    region = region)
  attr(cc, "ref.genome") <- NULL
  return(cc)
}

spectra$PCAWG$SBS96 <- rr("WGS_PCAWG.96.csv", "genome")
spectra$PCAWG$SBS192<- rr("WGS_PCAWG.192.csv", "transcript")
spectra$PCAWG$SBS1536<- rr("WGS_PCAWG.1536.csv", "genome")
spectra$PCAWG$DBS78<- rr("WGS_PCAWG.dinucs.csv", "genome")
spectra$PCAWG$ID<- rr("WGS_PCAWG.indels.csv", "genome")

# The next 2 for backward compatibility. Deprecated.
spectra$SBS96 <- spectra$PCAWG$SBS96
spectra$DBS78 <- spectra$PCAWG$DBS78

spectra$other.genome$SBS96 <- rr("WGS_Other.96.csv", "genome")
spectra$other.genome$SBS192<- rr("WGS_Other.192.csv", "transcript")
spectra$other.genome$SBS1536<- rr("WGS_Other.1536.csv", "genome")
spectra$other.genome$DBS78<- rr("WGS_Other.dinucs.csv", "genome")
# Note, no indels

spectra$TCGA$SBS96 <- rr("WES_TCGA.96.csv", "exome")
spectra$TCGA$SBS192<- rr("WES_TCGA.192.csv", "exome")
spectra$TCGA$SBS1536<- rr("WES_TCGA.1536.csv", "exome")
spectra$TCGA$DBS78<- rr("WES_TCGA.dinucs.csv", "exome")
spectra$TCGA$ID<- rr("WES_TCGA.indels.csv", "exome")

spectra$other.exome$SBS96 <- rr("WES_Other.96.csv", "exome")
spectra$other.exome$SBS192<- rr("WES_Other.192.csv", "exome")
spectra$other.exome$SBS1536<- rr("WES_Other.1536.csv", "exome")
spectra$other.exome$DBS78<- rr("WES_Other.dinucs.csv", "exome")
# Note, no indels
