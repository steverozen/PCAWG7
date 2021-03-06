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
