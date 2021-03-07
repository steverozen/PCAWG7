context("SplitPCAWGMatrixByTumorType")

test_that("SplitPCAWGMatrixByTumorType", {
  spectra.list <- SplitPCAWGMatrixByTumorType(spectra$PCAWG$SBS96)
  expect_equal(length(spectra.list), 37)
})
