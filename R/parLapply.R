library(parallel)
n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

cl <- makeCluster(nWorkers)

time <- system.time(
    parLapply(cl, 1:n, function(x) runif(1))
)[[3]]
stopCluster(cl)

table <- data.frame(
    source = "r-base",
    package = "parallel",
    backend = "socket",
    call = "parLapply",
    time = time)

saveRDS(table, "results/parLapply")
