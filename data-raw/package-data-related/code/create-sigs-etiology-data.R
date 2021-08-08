# Source this file from PCAWG7 package root

cat(getwd(), "\n")

tmp.SBS96 <-
  data.table::fread("data-raw/package-data-related/source-files/COSMIC-v3-SBS-proposed-aetiology-short-form.csv")
sigs.etiologies.SBS96 <-
  matrix(tmp.SBS96$proposed.aetiology, ncol = 1,
         dimnames = list(tmp.SBS96$name, "proposed.etiology"))

tmp.SBS192 <-
  data.table::fread("data-raw/package-data-related/source-files/COSMIC-v3-SBS-proposed-aetiology-short-form.csv")
# "SBS84" "SBS85" "SBS86" "SBS87" "SBS89" do not have SBS192 signature
tmp2.SBS192 <- tmp.SBS192[!name %in% c("SBS84", "SBS85", "SBS86", "SBS87", "SBS89"), ]
sigs.etiologies.SBS192 <-
  matrix(tmp2.SBS192$proposed.aetiology, ncol = 1,
         dimnames = list(SBS96_ID_to_SBS192_ID(tmp2.SBS192$name), "proposed.etiology"))

tmp.DBS78 <-
  data.table::fread("data-raw/package-data-related/source-files/COSMIC-v3-DBS-proposed-aetiology-short-form.csv")
sigs.etiologies.DBS78 <-
  matrix(tmp.DBS78$proposed.aetiology, ncol = 1,
         dimnames = list(tmp.DBS78$name, "proposed.etiology"))

tmp.ID <-
  data.table::fread("data-raw/package-data-related/source-files/COSMIC-v3-ID-proposed-aetiology-short-form.csv")
sigs.etiologies.ID <-
  matrix(tmp.ID$proposed.aetiology, ncol = 1,
         dimnames = list(tmp.ID$name, "proposed.etiology"))

sigs.etiologies <- list(SBS96 = sigs.etiologies.SBS96,
                        SBS192 = sigs.etiologies.SBS192,
                        DBS78 = sigs.etiologies.DBS78,
                        ID = sigs.etiologies.ID)
