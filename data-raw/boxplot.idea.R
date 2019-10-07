
x1 <- read.csv("data-raw/cosSim2.csv", stringsAsFactors = FALSE)
colnames(x1) <- c("seed", "cs", "cor", "ratio")
x1$cor <- as.numeric(substr(x1$cor, 7, 9))
x1$ratio <- as.numeric(substr(x1$ratio, 19, nchar(x1$ratio)))

require(ggplot2)
ggplot(x1, aes(x=as.factor(cor), y=cs, fill=as.factor(ratio))) +
  geom_violin() + ggtitle(label = "MultiModalMuSig")

ggplot(x1, aes(x=as.factor(ratio), y=cs, fill=as.factor(cor))) +
  geom_violin() + ggtitle(label = "MultiModalMuSig") + xlab("SBS1:SBS5 ratio") +
  ylab("Averge of SBS1 and SBS5 cosine similarity") + labs(fill = "Correlation") +
  scale_fill_brewer(palette = "Greys")
