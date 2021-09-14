library(foreach)
library(doParallel)
cl <- makeCluster(nWorkers, type="SOCK")
registerDoParallel(cl)
time1 <- system.time(
    {
       foreach(i=1:n) %dopar% benchFunc()
    }
)[[3]]
stopCluster(cl)


backend <- c("doParallel")
time <- c(time1)

table <- data.frame(
    source = "r-base",
    package = "foreach",
    backend = backend,
    version = packageVersion("doParallel"),
    call = "foreach",
    time = time)
