#' PCAWG7 SigProfiler reference signatures.
#'
#' @source Subdirectories of \url{https://www.synapse.org/#!Synapse:syn12009743},
#'  2019 Oct 09, populated by
#'  \code{data-raw/populate.variable.siganture.R}.
#'
#' @format
#'
#' A list with one element, \code{signature}, which in turn is a list
#' with elements:
#'
#' \describe{
#'   \item{genome}{A list with the elements:
#'
#'   \describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions in trinucleotide context.}
#'     \item{SBS192}{Transcriptionally stranded single-base substitutions in trinucleotide context.}
#'     \item{DBS78}{Strand-agnostic doublet-base substitutions.}
#'     \item{ID}{Strand-agnostic indels.}
#'   }}
#'
#'   \item{exome}{A list with the elements:
#'
#'   \describe{
#'     \item{SBS96}{As above, for exome count signatures, which look
#'           different than genome count signatures, because of
#'           differences in trinucleotide frequencies in exomes versus
#'           whole genomes. These were signatures that were extracted
#'           from exome data in the PCAWG7 paper, not simple adjustment
#'           of the \code{genome} signatures for exome trinucleotide
#'           abundances.}
#'  }}
#' }
#'
#' @name COSMIC.v3.0
#'
#' @examples
#' SBS96.sigs <- COSMIC.v3.0$signature$genome$SBS96
"COSMIC.v3.0"
