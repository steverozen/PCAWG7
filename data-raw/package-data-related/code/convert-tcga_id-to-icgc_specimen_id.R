# Source this file from PCAWG7 package root

cat(getwd(), "\n")

tcga.uuid.file <- "data-raw/pc_annotation-tcga_uuid2barcode.tsv.gz"
tcga.uuid.dt <- data.table::fread(tcga.uuid.file, header = FALSE)

# Only select those rows that have donor ID
tcga.uuid.dt <- tcga.uuid.dt[V2 == "donor", ]
colnames(tcga.uuid.dt) <- c("cancer_type", "sample_info", "submitter_donor_id", "tcga_id")

pcawg.uuid.file <- "data-raw/pcawg_sample_sheet.v1.4.2016-09-14.tsv"
pcawg.uuid.dt <- data.table::fread(pcawg.uuid.file)

merged.dt <- dplyr::inner_join(pcawg.uuid.dt, tcga.uuid.dt, by = "submitter_donor_id")
print(object.size(merged.dt), units = "auto")

# Only keep four columns "tcga_id", "submitter_donor_id",
# "icgc_specimen_id", "dcc_specimen_type"
needed.column.names <-
  c("tcga_id", "submitter_donor_id", "icgc_specimen_id", "dcc_specimen_type")
needed.dt <- merged.dt[, ..needed.column.names]

# Keep only tumour samples
tumour.indices <- grep("tumour", needed.dt$dcc_specimen_type)
TCGA.ICGC.IDs <- needed.dt[tumour.indices,]
print(object.size(TCGA.ICGC.IDs), units = "auto")
