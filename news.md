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
