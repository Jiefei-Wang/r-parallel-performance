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
time <- system.time(
    bplapply(1:n, function(x) runif(1), BPPARAM = p)
)[[3]]
bpstop(p)


BPTable <- data.frame(
    source = "BiocManager",
    package = "BiocParallel",
    backend = "SnowParam",
    call = "bplapply",
    time = time)


saveRDS(BPTable, "results/BiocParallel")

