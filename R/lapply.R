n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

rbaseTime <- system.time(
    lapply(1:n, function(x) runif(1))
)


lapplyTable <- data.frame(package = "rbase",
                          backend = "lapply",
                          time = rbaseTime[[3]])

dir.create("results")
saveRDS(lapplyTable, "results/lapply")
