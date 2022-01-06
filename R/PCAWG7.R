#' PCAWG7: A package of data from paper 'Repertoire
#' of Mutational Signatures in Human Cancer'
#'
#' This is a data package with 2 main package variables:
#' \code{\link{exposure}} and \code{\link{spectra}}.
#'
#' There are also PDF plots of the signatures in \code{data-raw/plots/}.
#'
#' There are also several functions for handling PCAWG identifiers:
#'
#' * \code{\link{map_SP_ID_to_tumor_type}}
#'
#' * \code{\link{map_aliquot_ID_to_SP_ID}}
#'
#' * \code{\link{SampleIDToCancerType}}
#'
#' * \code{\link{SplitPCAWGMatrixByTumorType}}
#'
#' * \code{\link{SplitMatrixBySampleType}}
#'
#' The reference for the data is
#'
#' Alexandrov, L.B., Kim, J., Haradhvala, N.J. et al.
#' The repertoire of mutational signatures in human cancer.
#' Nature 578, 94-101 (2020). \doi{10.1038/s41586-020-1943-3}.
#'
#' @docType package
#' @name PCAWG7
NULL
