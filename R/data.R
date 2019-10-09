#' Single Base Substitution (SBS) spectra in trinucleotide context.
#'
#'
#' @name PCAWG.WGS.SBS.96
"PCAWG.WGS.SBS.96"


#' Doublet Base Substitution (SBS) spectra.
#'
#'
#' @name PCAWG.WGS.DBS
"PCAWG.WGS.DBS"

#' PCAWG7 SigProfiler whole genome signatures.
#'
#'This is list with the following elements and sub-elements:
#'
#' \describe{
#'   \item{genome}{\describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'     \item{SBS192}{Transcriptionally stranded single-base substitutions in trinucleotide context}
#'     \item{DBS}{Strand-agnostic doublet-base substitutions}
#'   }}
#'   \item{exome}{\describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'  }}
#' }
#'
#' @name sgnature
"signature"

#' Vectors of PCAWG \code{tumor_wgs_icgc_specimin_id}
#'
#' @source https://dcc.icgc.org/api/v1/download?fn=/PCAWG/data_releases/latest/release_may2016.v1.4.with_consensus_calls.tsv, 2019 Oct 09
#'
#' @name PCAWG.sample.id
"PCAWG.sample.id"
