test_that("GetEtiology", {
ee <- GetEtiology("ID", c("ID1", "foo", "ID3"))
expect_equal(ee,
             c(ID1 = "Replication slippage; defective DNA mismatch repair",
               foo = "",
               ID3 = "Tobacco smoking"))
})
