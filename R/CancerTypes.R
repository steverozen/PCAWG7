#' Return a character vector of some common cancer types
#'
#' @export
#'
#' @examples
#' CancerTypes()[1:5]
CancerTypes <- function() {
  return(c("Biliary-AdenoCA", "Bladder-TCC", "Bone-Benign", "Bone-Epith",
           "Bone-Osteosarc", "Breast-AdenoCA", "Breast-DCIS", "Breast-LobularCA",
           "Cervix-AdenoCA", "Cervix-SCC", "CNS-GBM", "CNS-Medullo", "CNS-Oligo",
           "CNS-PiloAstro", "ColoRect-AdenoCA", "Eso-AdenoCA", "Head-SCC",
           "Kidney-ChRCC", "Kidney-RCC", "Liver-HCC", "Lung-AdenoCA", "Lung-SCC",
           "Lymph-BNHL", "Lymph-CLL", "Myeloid-AML", "Myeloid-MDS", "Myeloid-MPN",
           "Ovary-AdenoCA", "Panc-AdenoCA", "Panc-Endocrine", "Prost-AdenoCA",
           "Skin-Melanoma", "SoftTissue-Leiomyo", "SoftTissue-Liposarc",
           "Stomach-AdenoCA", "Thy-AdenoCA", "Uterus-AdenoCA"))
}
