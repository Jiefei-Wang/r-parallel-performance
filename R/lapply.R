source("R/.common.R")
time <- system.time(
    lapply(1:n, benchFunc)
)[[3]]


table <- data.frame(
    source = "r-base",
    package = "base",
    backend = "NA",
    call = "lapply",
    time = time)


saveRDS(table, "results/lapply")
