n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

time <- system.time(
    lapply(1:n, function(x) runif(1))
)[[3]]


lapplyTable <- data.frame(
    source = "r-base",
    package = "base",
    backend = "NA",
    call = "lapply",
    time = time)


saveRDS(lapplyTable, "results/lapply")
