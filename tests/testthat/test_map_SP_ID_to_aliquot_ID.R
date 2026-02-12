test_that("map_SP_ID_to_aliquot_ID round-trips with map_aliquot_ID_to_SP_ID", {
  SP.ids <- c("SP58101", "SP112290")
  aliquot.ids <- map_SP_ID_to_aliquot_ID(SP.ids)
  expect_false(any(is.na(aliquot.ids)))
  SP.ids.back <- map_aliquot_ID_to_SP_ID(aliquot.ids)
  expect_equal(SP.ids.back, SP.ids)
})

test_that("map_SP_ID_to_aliquot_ID warns on unknown SP IDs", {
  SP.ids <- c("SP58101", "foo", "bar")
  expect_warning(aliquot.ids <- map_SP_ID_to_aliquot_ID(SP.ids),
                 "Cannot find matching aliquot IDs")
  expect_false(is.na(aliquot.ids[1]))
  expect_true(is.na(aliquot.ids[2]))
  expect_true(is.na(aliquot.ids[3]))
})
