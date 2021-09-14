source("R/.common.R")
n <- nOverhead
benchFunc <- benchFunc.overhead
source("R/.common-lapply.R")
saveRDS(table, "results/overhead/lapply")
