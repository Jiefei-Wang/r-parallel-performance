source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-lapply.R")
saveRDS(table, "results/cpu/lapply")
