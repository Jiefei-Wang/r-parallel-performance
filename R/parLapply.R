source("R/.common.R")
library(parallel)

cl <- makeCluster(nWorkers)

time <- system.time(
    parLapply(cl, 1:n, benchFunc)
)[[3]]
stopCluster(cl)

table <- data.frame(
    source = "r-base",
    package = "parallel",
    backend = "socket",
    call = "parLapply",
    time = time)

saveRDS(table, "results/parLapply")
