#' Single Base Substitution (SBS) spectra in trinucleotide context (deprecated).
#' Use \code{\link{spectra}$SBS96} instead.
#'
#'
#' @name PCAWG.WGS.SBS.96
"PCAWG.WGS.SBS.96"


#' Doublet Base Substitution (SBS) spectra (deprecated).
#' Use \code{\link{spectra}$DBS78} instead.
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
#' A list with the elements:
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
#'           whole genomes.}
#'  }}
#' }
#'
#' @name signature
"signature"


#' PCAWG7 SigProfiler assignments (exposures).
#'
#' @source Files of \url{https://www.synapse.org/#!Synapse:syn12009743},
#'   2019 Oct 09, populated by
#'  \code{data-raw/sig.profiler.exposures/load.package.variable.exposure.R}.
#'
#' @format
#'
#' A list with the elements:
#'
#' \describe{
#'   \item{PCAWG}{A list with the elements:
#'   \describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions
#'                  in trinucleotide context.}
#'     \item{DBS78}{Strand-agnostic doublet-base substitutions.}
#'     \item{ID}{Strand-agnostic indels.}
#'     These are signature assignments for the PCAWG platinum genomes.
#'   }}
#'   \item{TCGA}{A list with the elements:
#'   \describe{
#'     \item{SBS96}{As above.}
#'     \item{ID}{As above.}
#'     These are signature assignments for the TCGA exomes.
#'   }}
#'   \item{other.genome}{A list with the element:
#'   \describe{
#'      \item{SBS96}{As above.}
#'      This contains signature assignments for non-TCGA
#'      genomes.}}
#'   \item{other.exome}{A list with the element:
#'   \describe{
#'      \item{SBS96}{As above.}
#'      This contains signature assignments for non-TCGA
#'      exomes.}}
#' }
#'
#' @name exposure
"exposure"

########
#' PCAWG7 mutational spectra (catalogs).
#'
#' @source Files below \url{https://www.synapse.org/#!Synapse:syn11801889},
#'   2019 Oct 09. Populated by
#'   \code{data-raw/spectra/load.package.variable.specra.R}.
#'
#' @format
#'
#' A list with the elements:
#'
#' \describe{
#'   \item{SBS96}{Deprecated.}
#'
#'   \item{DBS78}{Deprecated.}
#'
#'   \item{PCAWG}{A list with the elements:
#'   \describe{
#'     \item{SBS96}{Strand-agnostic single-base substitutions
#'                  in trinucleotide context.}
#'     \item{SBS192}{Single-base substitutions in transcripts
#'                  based on the sense strand.}
#'     \item{SBS1536}{Strand-agnostic single-base substitutions
#'                  in pentanucleotide context.}
#'
#'     \item{DBS78}{Strand-agnostic doublet-base substitutions.}
#'     \item{ID}{Strand-agnostic indels.}
#'
#'   }}
#'   \item{TCGA}{A list with the same elements as the
#'               \code{PCAWG} element.}
#'   \item{other.genome}{A list with the same elements as the
#'               \code{PCAWG} element but with \code{ID} omitted.}
#'   \item{other.exome}{A list with the same elements as the
#'               \code{PCAWG} element but with \code{ID} omitted.}
#' }
#'
#' @name spectra
"spectra"


#' Vectors of the PCAWG \code{tumor_wgs_icgc_specimin_id}s.
#'
#' Note that the PCAWG7 spectra catalogs have 2
#' sample ids that were blacklisted after the mutational
#' signature analysis was
#' underway. The blacklisted samples are \code{SP116419}
#' and \code{SP116883}, which are in \code{PCAWG.sample.id$black}.
#'
#' @source \url{https://dcc.icgc.org/api/v1/download?fn=/PCAWG/data_releases/latest/release_may2016.v1.4.with_consensus_calls.tsv},
#'  2019 Oct 09
#'
#' @format
#'
#' A list with the elements:
#'
#' \describe{
#'   \item{white}{Whitelisted IDs}
#'   \item{grey}{Greylisted IDs}
#'   \item{black}{Blacklisted IDs}
#' }
#'

#' @name PCAWG.sample.id
"PCAWG.sample.id"
