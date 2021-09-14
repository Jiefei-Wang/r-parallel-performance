nOverhead <- as.integer(Sys.getenv("nOverhead", 100L))
nCpuBurn <- as.integer(Sys.getenv("nCpuBurn", 100L))
nMemBurn <- as.integer(Sys.getenv("nMemBurn", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

benchFunc.overhead <- function(x) runif(1)
