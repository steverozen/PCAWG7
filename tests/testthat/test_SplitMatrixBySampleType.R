test_that("SplitMatrixBySampleType spectra", {
  mm <- spectra$PCAWG$SBS96[ , 1:2]
  # print(class(mm))
  ff <- SplitMatrixBySampleType(mm, c("foo", "bar"))
  expect_equal(ff[["bar"]], mm[ , 2, drop = FALSE])
  expect_equal(ff[["foo"]], mm[ , 1, drop = FALSE])
})

test_that("SplitMatrixBySampleType exposures", {
  mm <- exposure$PCAWG$SBS96[ , 1:2]
  # print(class(mm))
  ff <- SplitMatrixBySampleType(mm, c("foo", "bar"))
  expect_equal(ff[["bar"]], mm[ , 2, drop = FALSE])
  expect_equal(ff[["foo"]], mm[ , 1, drop = FALSE])
})
