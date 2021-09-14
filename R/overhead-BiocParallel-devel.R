BiocManager::install("BiocParallel",
                     update = FALSE,
                     ask = FALSE,
                     force = TRUE,
                     version='devel')


pkgSource <- "BiocParallel-devel"
source("R/.common.R")
n <- nOverhead
benchFunc <- benchFunc.overhead
source("R/.common-BiocParallel.R")
saveRDS(table, "results/overhead/BiocParallel_Github_Bioconductor")
