# Source this file from PCAWG7 package root

cat(getwd(), "\n")

tcga.uuid.file <- "data-raw/pc_annotation-tcga_uuid2barcode.tsv.gz"
tcga.uuid.dt <- data.table::fread(tcga.uuid.file, header = FALSE)
colnames(tcga.uuid.dt) <- c("cancer_type", "sample_info", "submitter_specimen_id", "tcga_id")

pcawg.uuid.file <- "data-raw/pcawg_sample_sheet.v1.4.2016-09-14.tsv"
pcawg.uuid.dt <- data.table::fread(pcawg.uuid.file)

merged.dt <- dplyr::full_join(pcawg.uuid.dt, tcga.uuid.dt, by = "submitter_specimen_id")
print(object.size(merged.dt), units = "auto")

# Only keep three columns "tcga_id", "submitter_specimen_id" and "icgc_specimen_id"
useful.column.names <- c("tcga_id", "submitter_specimen_id", "icgc_specimen_id")
useful.dt <- merged.dt[, ..useful.column.names]
print(object.size(useful.dt), units = "auto")

# Discard rows with NA values for "icgc_specimen_id"
TCGA.ICGC.IDs <- na.omit(useful.dt, cols = "icgc_specimen_id")
print(object.size(TCGA.ICGC.IDs), units = "auto")

usethis::use_data(TCGA.ICGC.IDs)
