
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PCAWG7

<!-- badges: start -->

[![R build
status](https://github.com/steverozen/PCAWG7/workflows/R-CMD-check/badge.svg)](https://github.com/steverozen/PCAWG7/actions)
[![License: GPL
v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

<!-- badges: end -->

## Purpose

Contains data from the paper by Alexandrov, Kim, Haradhvala, Huang et
al., ‘The repertoire of Mutational Signatures in Human Cancer’
<https://doi.org/10.1038/s41586-020-1943-3>. Please see `?PCAWG7`. The
funny name comes from the fact that this paper was generated by Working
Group 7 of the Pan Cancer Analysis of Whole Genomes (PCAWG) consortium.
The data were then placed on the COSMIC web site and subsequently
updated.

## Installation

### Latest stable version

``` r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github(repo = "steverozen/PCAWG7")
```

### Get the development version

To use new features in the development version, you can install PCAWG7
from the master branch on
[GitHub](https://github.com/steverozen/PCAWG7/tree/master), which may
not be stable:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
remotes::install_github(repo = "steverozen/PCAWG7", ref = "master")
```

## Reference manual

<https://github.com/steverozen/PCAWG7/blob/v0.1.3-branch/data-raw/PCAWG7_0.1.3.pdf>
