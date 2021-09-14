n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

benchFunc <- function(x) runif(1)
