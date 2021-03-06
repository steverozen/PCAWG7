context("SplitMatrixBySampleType")

test_that("SplitMatrixBySampleType", {
  spectra.list <- SplitMatrixBySampleType(M = spectra$PCAWG$SBS96,
                                          sample.type = c("Biliary-AdenoCA",
                                                          "Bladder-TCC"))
  expect_equal(length(spectra.list), 2)
  expect_equal(dim(spectra.list[[1]]), c(96, 35))
  expect_equal(dim(spectra.list[[2]]), c(96, 23))
})
