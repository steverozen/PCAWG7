test_that("SplitPCAWGMatrixByTumorType", {
  skip_if("" == system.file(package = "ICAMS"))
  spectra.list <- SplitPCAWGMatrixByTumorType(spectra$PCAWG$SBS96)
  expect_equal(length(spectra.list), 37)
})
