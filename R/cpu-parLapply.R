source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-parLapply.R")
saveRDS(table, "results/cpu/parLapply")
