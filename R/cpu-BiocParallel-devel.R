BiocManager::install("BiocParallel", ask = FALSE, update = FALSE)

pkgSource <- "BioConductor-devel"
source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-BiocParallel.R")
saveRDS(table, "results/cpu/BiocParallel_Github_Bioconductor")
