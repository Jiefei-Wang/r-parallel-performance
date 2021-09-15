source("R/.common.R")
pkgs <- c("BiocManager", "knitr", "foreach", "doParallel", "benchmarkme")
for(i in pkgs){
    if(!requireNamespace(i)){
        install.packages(i)
    }
}
BiocManager::install(version='devel', ask = FALSE, update = FALSE)


files <- list.files("R", full.names = TRUE)
rscript <- R.home("bin/Rscript")
for(i in files){
    system2(rscript, shQuote(i), stdout = TRUE, wait = TRUE)
}
