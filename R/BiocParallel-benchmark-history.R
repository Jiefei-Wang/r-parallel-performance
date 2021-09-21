# BiocManager::install("BiocParallel", ask = FALSE, update = FALSE)

pkgSource <- "BioConductor"
source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-BiocParallel.R")
file <- paste0("results/history/BiocParallel-cpu-", packageVersion("BiocParallel"))
saveRDS(table, file)


n <- nOverhead
benchFunc <- benchFunc.overhead
source("R/.common-BiocParallel.R")
file <- paste0("results/history/BiocParallel-overhead-", packageVersion("BiocParallel"))
saveRDS(table, file)