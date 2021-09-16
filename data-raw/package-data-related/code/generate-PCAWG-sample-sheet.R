require(data.table)
file <- "./data-raw/pcawg.sample.sheets/pcawg_sample_sheet.v1.4.2016-09-14.tsv"
PCAWG.sample.sheet <- data.table::fread(file)

usethis::use_data(PCAWG.sample.sheet, overwrite = TRUE)
