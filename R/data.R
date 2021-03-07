#' PCAWG7 SigProfiler signature assignments (numbers of mutations due to each signature in each tumor).
#'
#' @source Files of \url{https://www.synapse.org/#!Synapse:syn12009743},
#'   2019 Oct 09, populated by
#'  \code{data-raw/sig.profiler.sures/load.package.variable.exposure.R}.
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
#'
#' @examples
#' SBS96.exposure <- exposure$PCAWG$SBS96
"exposure"


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
#'
#' @examples
#' SBS96.spectra <- spectra$PCAWG$SBS96
"spectra"

#' Exposure statistics from the PCAWG7 paper
#'
#' @source Computed from other package variables using \code{GatherPCAWG7ExposureStatsSBS96}.
#'
#' @format A list with one element, \code{PCAWG}, which has the sub-elements \code{SBS96}, \code{DBS78},
#' \code{ID} with statistics for the corresponding mutation types by cancer type.
#' I.e. each element has a sub-element for each cancer type, and this element is a data.frame
#' with one row for each signature and
#' columns \code{mean.of.those.present} (the mean number of mutations for those tumors that
#' have the mutation) and \code{proportion.present} (the proportion of tumors in which the
#' signature is present).
#'
#' @examples
#'
#' exposure.stats$PCAWG$SBS96$`Biliary-AdenoCA`[1:3, ]
#'
#' @name exposure.stats
"exposure.stats"


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

#' List of proposed etiologies from PCAWG7 paper, some manually abbreviated and a few summarized from the COSMIC web site.
#'
#' @format
#'
#' A list with the elements:
#'
#' \describe{
#'   \item{SBS96}{}
#'   \item{SBS192}{}
#'   \item{DBS78}{}
#'   \item{ID}{}
#' }
#'
#' Each list element is a single column matrix with rownames being the
#' signature IDs and values being a short character string
#' description of the
#' proposed etiology.
#'
#' In general use \code{\link{GetEtiology}}, which handles new
#' signatures without elements in \code{sigs.etiologies}.
#' @name sigs.etiologies
"sigs.etiologies"
