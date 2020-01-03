#' Single Base Substitution (SBS) spectra in trinucleotide context (deprecated).
#'
#'
#' @name PCAWG.WGS.SBS.96
"PCAWG.WGS.SBS.96"


#' Doublet Base Substitution (SBS) spectra (deprecated).
#'
#'
#' @name PCAWG.WGS.DBS
"PCAWG.WGS.DBS"

#' PCAWG7 SigProfiler reference signatures.
#'
#' @source Subdirectories of \url{https://www.synapse.org/#!Synapse:syn12009743},
#'  2019 Oct 09, populated by
#'  \code{data-raw/populate.variable.siganture.R}.
#'
#' @format
#'
#' A list with the following elements and sub-elements:
#'
#' \describe{
#'   \item{genome}{\describe{A list with the elements:
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'     \item{SBS192}{Transcriptionally stranded single-base substitutions in trinucleotide context.}
#'     \item{DBS}{Strand-agnostic doublet-base substitutions.}
#'     \item{ID}{Strand-agnostic indels.}
#'   }}
#'   \item{exome}{\describe{A list with the elements:
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'  }}
#' }
#'
#' @name sgnature
"signature"

#' Vectors of PCAWG \code{tumor_wgs_icgc_specimin_id}.
#'
#' Note the the PCAWG7 spectra catalogs have 2 blacklisted
#' sample ids (they were blacklisted after the analysis was
#' underway). The blacklisted samples are \code{SP116419}
#' and \code{SP116883}.
#'
#' @source \url{https://dcc.icgc.org/api/v1/download?fn=/PCAWG/data_releases/latest/release_may2016.v1.4.with_consensus_calls.tsv},
#'  2019 Oct 09
#'
#' @name PCAWG.sample.id
"PCAWG.sample.id"
