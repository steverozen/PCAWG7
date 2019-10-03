# Generate extended data table 1
#

require(MASS)
require(stats)

GenerateExDataTable1 <- function() {
  SBS.count <- colSums(PCAWG.WGS.SBS.96)
  DBS.count <- colSums(PCAWG.WGS.DBS)
  m1 <-
    matrix(unlist(strsplit(colnames(PCAWG.WGS.SBS.96), "::", fixed = TRUE)),
           nrow = 2)
  m2 <- t(m1)
  colnames(m2) = c("Cancer.Type", "Sample.ID")
  s1 <- split(m2[ , "Cancer.Type"], m2[ , "Cancer.Type"])
  type.count <- lapply(X = s1, length)
  my.data <- data.frame(m2, SBS.count, DBS.count)
  # glm.out <- glm(log(DBS.count + 1) ~ log(SBS.count + 1) + Cancer.Type, data = my.data)
  # glm.out <- glm(DBS.count ~ SBS.count * Cancer.Type, data = my.data)
  glm.out <- glm(DBS.count ~ SBS.count + Cancer.Type, data = my.data)
  # rlm.out <- rlm(DBS.count ~ SBS.count + Cancer.Type, maxit = 100, data = my.data)
  tmp <- tempfile()
  capture.output(print(summary(glm.out), digits = 2), file = tmp)
  tb <- read.table(tmp, fill = TRUE, stringsAsFactors = FALSE)
  tb <- tb[-(1:7), ]
  tb <- tb[1:(length(type.count) + 1), ]
  colnames(tb) <-
    c("Coef. name", "Estimate", "Std. Error",
      "t value", "Pr(> |t|)", "Sig?")
  tb <- tb[ , 1:6]
  tb <- rbind(tb[1:2, ],
              rep("", ncol(tb)),
              tb[3:nrow(tb), ], stringsAsFactors = FALSE)
  sample.count <- c("NA", "NA", unlist(type.count))
  tb <- cbind(tb, `Tumour count` = sample.count,
              nm = names(sample.count),
              stringsAsFactors = FALSE)
  tb[3, "Coef. name"] <- tb[3, "nm"]
  tb[ , "Coef. name"] <- sub("Cancer.Type","", tb[ , "Coef. name"])
  stopifnot(tb[3:nrow(tb) , "Coef. name"] == tb[3:nrow(tb) , "nm" ])
  tb <- tb[ , -8]
  write.csv(tb, "ED.table.1.csv")
  return(list(glm.out = glm.out, rlm.out = rlm.out, type.count = type.count, tb = tb))
}
