# PCAWG.sample.sheets

require(data.table)
sheet1 <- fread("data-raw/release_may2016.v1.4.tsv")
sheet2 <- fread("data-raw/release_may2016.v1.4.with_consensus_calls.tsv")
setdiff(colnames(sheet1), colnames(sheet2))
# character(0)
setdiff(colnames(sheet2), colnames(sheet1))
# character(0)

setdiff(unique(sheet1$tumor_wgs_icgc_specimen_id), unique(sheet2$tumor_wgs_icgc_specimen_id))
# character(0)
setdiff(unique(sheet2$tumor_wgs_icgc_specimen_id), unique(sheet1$tumor_wgs_icgc_specimen_id))
# character(0)

any(duplicated(sheet1$tumor_wgs_icgc_specimen_id))
any(duplicated(sheet2$tumor_wgs_icgc_specimen_id))

unique(sheet2$wgs_exclusion_white_gray)
# [1] "Whitelist" "Graylist"  "Excluded"
white <- sheet2[sheet2$wgs_exclusion_white_gray == "Whitelist", ]
grey  <- sheet2[sheet2$wgs_exclusion_white_gray == "Graylist", ]
black <- sheet2[sheet2$wgs_exclusion_white_gray == "Excluded", ]
stopifnot(nrow(sheet2) == nrow(white) + nrow(grey) + nrow(black))
white.id <- unique(unlist(strsplit(white$tumor_wgs_icgc_specimen_id, ",")))
black.id <- unique(unlist(strsplit(black$tumor_wgs_icgc_specimen_id, ",")))
grey.id  <- unique(unlist(strsplit(grey$tumor_wgs_icgc_specimen_id,  ",")))
SBS.id <- sub(".*::", "", colnames(PCAWG.WGS.SBS.96), perl = TRUE)
setdiff(white.id, SBS.id)
setdiff(grey.id, SBS.id)
setdiff(SBS.id, c(white.id, grey.id))
# [1] "SP116419" "SP116883"
# SP116883 was removed between v1.3 and v1.4
intersect(SBS.id, black.id)
# SP116419

PCAWG.sample.id <- list(
  white = white.id,
  grey  = grey.id,
  black = c(black.id, "SP116883"))

usethis::use_data(PCAWG.sample.id)
