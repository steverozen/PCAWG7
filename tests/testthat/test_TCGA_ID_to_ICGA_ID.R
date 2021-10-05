test_that("TCGA_ID_to_ICGC_ID", {
  tcga.ids <- c("TCGA-AA-A01V", "foo", "TCGA-CA-6717", "bar")
  icgc.ids <- expect_warning(TCGA_ID_to_ICGC_ID(tcga.ids))
  icgc.ids <- icgc.ids[!is.na(icgc.ids)]
  expect_equal(icgc.ids, c("SP16934", "SP17905"))
})
