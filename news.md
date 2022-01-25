# PCAWG7 0.1.3
* Removed the following exported data and functions as they are moved to another package [cosmicsig](https://CRAN.R-project.org/package=cosmicsig):
  + `COSMIC.v3.2`
  + `COSMIC.v3.1`
  + `COSMIC.v3.0`
  + `signature`
  + `etiologies`
  + `GetEtiology`
  + `SBS96_ID_to_SBS192_ID`

* Removed `tests\testthat\test_GetEtiology.R`

* Removed `tests\testthat\test_SBS96_ID_to_SBS192_ID.R`

* Updated documentation

# PCAWG7 0.1.1.9006
* Added new exported data `COSMIC.v3.2` and documentation

# PCAWG7 0.1.1.9005
* Renamed internal data `sigs.etiologies` to `etiologies` and made it exported

# PCAWG7 0.1.1.9004
* Moved `ICAMS` package to `Suggests` filed in DESCRIPTION and updated code 
to use the package conditionally

* Moved some obsolete code in SignatureExposureInfo.R to data-raw/old.code 

# PCAWG7 0.1.1.9003
* Improved time performance for function `map_aliquot_ID_to_SP_ID` and added `Note` section in documentation. Return NA with
a warning for those aliquot IDs that cannot be matched to any "SP" IDs

# PCAWG7 0.1.1.9002
* Fixed typo in SBS96 signature etiologies table

# PCAWG7 0.1.1.9001
* Added new exported data `PCAWG.sample.sheet`, `COSMIC.v3.1`

* Added new exported function `map_aliquot_ID_to_SP_ID`

* Updated exported data `signature` from COSMIC v3.2 website and added signature
etiologies data for new signatures

* Updated description for package documentation

# PCAWG7 0.1.0.9006
* Corrected typos in data `sigs.etiologies` for SBS6 and SBS44

# PCAWG7 0.1.0.9005
* Removed "SBS84" "SBS85" "SBS86" "SBS87" "SBS89" from internal data `sigs.etiologies$SBS192`

# PCAWG7 0.1.0.9004
* Added new exported function `TCGA_ID_to_ICGC_ID` to translate TCGA(The Cancer
Genome Atlas) IDs to ICGC(International Cancer Genome Consortium) IDs

* Added internal data `TCGA.ICGC.IDs`

# PCAWG7 0.1.0.9003
* Added new exported function `CancerTypes` for returning a character vector of some common cancer types

# PCAWG7 0.1.0.9002
* Added more examples and tests for exported data and functions

# PCAWG7 0.1.0.9001

* Adapted SplitMatrixBySampleType to work with ICAMS catalogs and added tests
* Made ICAMS an Imports (because needed for the classes of the spectra and 
   signature package variables)

# PCAWG7 0.1.0.9000

* Non-backward-compatible: Removed package variables PCAWG.WGS.SBS.96 and PCAWG.WGS.DBS.
* Non-backward-compatible: made former COSMIC.v3.1$signature into signature,
   and made former signature into COSMIC.v3.0$signature

# PCAWG7 0.0.3.9006

* Added new exported data `COSMIC.v3.1` which contain the latest signatures from
COSMIC website.

# PCAWG7 0.0.3.9004

* Added indels and DBSs to exposure.stats and improved documentation.

# PCAWG7 0.0.3.9003

* Working toward adding package variable exposure.stats 

# PCAWG7 0.0.3
* Added package man page.
* Added more plots to data-raw/plots/

# PCAWG7 0.0.2
* Fully populated and documented exposure and spectra
* All changes backward compatible

# PCAWG7 0.0.0.9006
* Corrected ID signatures; they were totally wrong.
* Made sure abundances were present where possible in signatures.

# PCAWG7 0.0.0.9004

* Added indel (ID) signatures.
* Removed BSgenome objects as reference genomes (causing problems in clients).
