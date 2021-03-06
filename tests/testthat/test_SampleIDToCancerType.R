context("SampleIDToCancerType")

test_that("SampleIDToCancerType", {
  cancer.type <- SampleIDToCancerType("Biliary-AdenoCA::SP117655")
  expect_equivalent(cancer.type, "Biliary-AdenoCA")
})
