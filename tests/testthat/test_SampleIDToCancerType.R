test_that("SampleIDToCancerType", {
  cancer.type <- SampleIDToCancerType("Biliary-AdenoCA::SP117655")
  expect_equal(cancer.type, "Biliary-AdenoCA", ignore_attr = TRUE)
})
