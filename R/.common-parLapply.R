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
    version = packageVersion("parallel"),
    call = "parLapply",
    time = time)
