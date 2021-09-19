
# BiocManager::install("BiocParallel", ask = FALSE, update = FALSE)

pkgSource <- "BioConductor-devel"
source("R/.common.R")
n <- nOverhead2
benchFunc <- benchFunc.overhead
source("R/.common-BiocParallel.R")
saveRDS(table, "results/overhead2/BiocParallel_Github_Bioconductor")
