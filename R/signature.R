#' Mutational signatures data from COSMIC, the Catalogue Of Somatic Mutations In
#' Cancer, (v3.1 - June 2020)
#'
#' @source Files downloaded from
#'   \url{https://cancer.sanger.ac.uk/cosmic/signatures/index.tt}, 2021 Feb and
#'   saved in \code{data-raw/COSMIC.v3.1/data/}. \cr Populated by
#'   \code{data-raw/COSMIC.v3.1/code/generate-COSMIC.v3.1-genome-sigs.R}.
#'
#' @format A list with a single element, \code{genome}, which is a
#'   list containing:
#'   \describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'     \item{SBS192}{Transcriptionally stranded single-base substitutions in trinucleotide context.}
#'     \item{DBS78}{Strand-agnostic doublet-base substitutions.}
#'     \item{ID}{Strand-agnostic indels.}
#'   }
#'
#' @section Remark:
#' The signatures are all from Human GRCh37 reference genome.
#'
#' @name signature
#'
#' @examples
#' SBS96.sigs <- signature$genome$SBS96
"signature"
