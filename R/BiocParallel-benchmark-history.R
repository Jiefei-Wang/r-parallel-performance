# BiocManager::install("BiocParallel", ask = FALSE, update = FALSE)

pkgSource <- "BioConductor"
source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-BiocParallel.R")
file <- paste0("results/history/BiocParallel-cpu-", packageVersion("BiocParallel"))

if(file.exists(file)){
  message("Before combine:", nrow(table))
  table <- rbind(readRDS(file),table)
  message("After combine:", nrow(table))
}
saveRDS(table, file)


n <- nOverhead
benchFunc <- benchFunc.overhead
source("R/.common-BiocParallel.R")
file <- paste0("results/history/BiocParallel-overhead-", packageVersion("BiocParallel"))
if(file.exists(file)){
  table <- rbind(readRDS(file),table)
}
saveRDS(table, file)