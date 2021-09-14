if(!requireNamespace("BiocManager"))
    install.packages("BiocManager")
if(!requireNamespace("BiocParallel"))
    BiocManager::install("BiocParallel")
if(!requireNamespace("knitr"))
    install.packages("knitr")

library(BiocParallel)
n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

p <- SnowParam(workers = nWorkers)
bpstart(p)
snowTime <- system.time(
    bplapply(1:n, function(x) runif(1), BPPARAM = p)
)
bpstop(p)


BPTable <- data.frame(package = "BiocParallel",
                      backend = "SnowParam",
                      time = snowTime[[3]])


saveRDS(BPTable, "results/BiocParallel")

