test_that("map_aliquot_ID_to_SP_ID", {
  aliquot.ids <- c("e0fccaf5-925a-41f9-b87c-cd5ee4aecb59", "foo")
  SP.ids <- map_aliquot_ID_to_SP_ID(aliquot.ids)
  SP.ids <- SP.ids[nzchar(SP.ids)]
  expect_equal(SP.ids, "SP1682" , ignore_attr = TRUE)
})
