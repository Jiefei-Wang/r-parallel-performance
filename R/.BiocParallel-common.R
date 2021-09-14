source("R/.common.R")
library(BiocParallel)
p <- SerialParam()
bpstart(p)
time1 <- system.time(
    bplapply(1:n, benchFunc, BPPARAM = p)
)[[3]]
bpstop(p)

p <- SnowParam(workers = nWorkers)
bpstart(p)
time2 <- system.time(
    bplapply(1:n, benchFunc, BPPARAM = p)
)[[3]]
bpstop(p)

if(Sys.info()[["sysname"]]!="Windows"){
    p <- MulticoreParam(workers = nWorkers)
    bpstart(p)
    time3 <- system.time(
        bplapply(1:n, benchFunc, BPPARAM = p)
    )[[3]]
    bpstop(p)
}else{
    time3 <- Inf
}


backend <- c("SerialParam", "SnowParam", "MulticoreParam")
time <- c(time1, time2, time3)

table <- data.frame(
    source = pkgSource,
    package = "BiocParallel",
    backend = backend,
    call = "bplapply",
    time = time)
