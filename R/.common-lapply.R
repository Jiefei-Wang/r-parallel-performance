time <- system.time(
    lapply(1:n, benchFunc)
)[[3]]


table <- data.frame(
    source = "r-base",
    package = "base",
    backend = "NA",
    version = packageVersion("base"),
    call = "lapply",
    time = time)
