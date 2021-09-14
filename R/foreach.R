if(!requireNamespace("foreach"))
    install.packages("foreach")
if(!requireNamespace("doParallel"))
    install.packages("doParallel")

source("R/.common.R")

library(foreach)
library(doParallel)
cl <- makeCluster(nWorkers, type="SOCK")
registerDoParallel(cl)
time <- system.time(
    {
       foreach(i=1:n) %dopar% benchFunc()
    }
)[[3]]
stopCluster(cl)


table <- data.frame(
    source = "r-base",
    package = "foreach",
    backend = "doParallel",
    call = "foreach",
    time = time)


saveRDS(table, "results/foreach")
