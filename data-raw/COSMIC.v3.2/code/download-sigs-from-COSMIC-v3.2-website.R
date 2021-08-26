# Source this file from PCAWG7 package root
cat(getwd(), "\n")

# Download SBS96 signatures from COSMIC v3.2 website
download.file(url = "https://cancer.sanger.ac.uk/signatures/documents/452/COSMIC_v3.2_SBS_GRCh37.txt",
              destfile = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_SBS_GRCh37.txt",
              quiet = TRUE)

# Download DBS78 signatures from COSMIC v3.2 website
download.file(url = "https://cancer.sanger.ac.uk/signatures/documents/446/COSMIC_v3.2_DBS_GRCh37.txt",
              destfile = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_DBS_GRCh37.txt",
              quiet = TRUE)

# Download ID signatures from COSMIC v3.2 website
download.file(url = "https://cancer.sanger.ac.uk/signatures/documents/451/COSMIC_v3.2_ID_GRCh37.txt",
              destfile = "./data-raw/COSMIC.v3.2/data/COSMIC_v3.2_ID_GRCh37.txt",
              quiet = TRUE)

# Download SBS192 signatures from COSMIC v3.2 website
SBS192.sig.number <- c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                       11:16, paste0(17, letters[1:2]), 18:60, 88, 90, 92:94)
stopifnot(length(SBS192.sig.number) == 70)
SBS192.sigs.urls <-
  paste0("https://cancer.sanger.ac.uk/sigs-assets-20/SBS_vignettes/sigProfiler_TSB_signatures_SBS",
         SBS192.sig.number, ".csv")
time.used.for.SBS192 <- system.time({
  sapply(SBS192.sigs.urls, FUN = function(x) {
    download.file(url = x,
                  destfile = paste0("./data-raw/COSMIC.v3.1/data/SBS192/",
                                    basename(x)),
                  quiet = TRUE)
  })
})
print(time.used.for.SBS192)
