test_that("SBS96_ID_to_SBS192_ID", {
  SBS96.ids <- c("SBS1", "SBS23", "SBS25")
  SBS192.ids <- SBS96_ID_to_SBS192_ID(SBS96.ids)
  expect_equal(SBS192.ids, c("SBS1", "SBS23-E", "SBS25-E"))
})
