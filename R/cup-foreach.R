source("R/.common.R")
n <- nCpu
benchFunc <- benchFunc.cpu
source("R/.common-foreach.R")
saveRDS(table, "results/cpu/foreach")
