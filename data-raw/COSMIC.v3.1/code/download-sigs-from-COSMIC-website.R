# Source this file from PCAWG7 package root
cat(getwd(), "\n")

# Download SBS96 signatures from COSMIC website
SBS96.sig.number <- c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                      11:16, paste0(17, letters[1:2]), 18:60, 84:90)
stopifnot(length(SBS96.sig.number) == 72)
SBS96.sigs.urls <-
  paste0("https://cancer.sanger.ac.uk/sigs-assets-20/SBS_vignettes/sigProfiler_SBS_signatures_SBS",
         SBS96.sig.number, ".csv")
time.used.for.SBS96 <- system.time({
  sapply(SBS96.sigs.urls, FUN = function(x) {
    download.file(url = x,
                  destfile = paste0("./data-raw/COSMIC.v3.1/data/SBS96/",
                                    basename(x)),
                  quiet = TRUE)
  })
})
print(time.used.for.SBS96)

# Download SBS192 signatures from COSMIC website
SBS192.sig.number <- c(1:6, paste0(7, letters[1:4]), 8:9, paste0(10, letters[1:2]),
                       11:16, paste0(17, letters[1:2]), 18:60, 88, 90)
stopifnot(length(SBS192.sig.number) == 67)
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

# Download DBS78 signatures from COSMIC website
DBS78.sigs.urls <-
  paste0("https://cancer.sanger.ac.uk/sigs-assets-20/DBS_vignettes/sigProfiler_DBS_signatures_DBS",
         1:11, ".csv")
time.used.for.DBS78 <- system.time({
  sapply(DBS78.sigs.urls, FUN = function(x) {
    download.file(url = x,
                  destfile = paste0("./data-raw/COSMIC.v3.1/data/DBS78/",
                                    basename(x)),
                  quiet = TRUE)
  })
})
print(time.used.for.DBS78)

# Download ID signatures from COSMIC website
ID.sigs.urls <-
  paste0("https://cancer.sanger.ac.uk/sigs-assets-20/ID_vignettes/sigProfiler_ID_signatures_ID",
         1:18, ".csv")
time.used.for.ID <- system.time({
  sapply(ID.sigs.urls, FUN = function(x) {
    download.file(url = x,
                  destfile = paste0("./data-raw/COSMIC.v3.1/data/ID/",
                                    basename(x)),
                  quiet = TRUE)
  })
})
print(time.used.for.ID)
