source("R/.common.R")
print(.libPaths())
print(dir(.libPaths()[1]))

pkgs <- c("BiocManager", "knitr", "foreach", "doParallel", "benchmarkme")
for(i in pkgs){
    if(!requireNamespace(i)){
        install.packages(i)
    }
}
BiocManager::install(version='devel', ask = FALSE, update = FALSE)


print(.libPaths())
print(dir(.libPaths()[1]))


files <- list.files("R", full.names = TRUE)
rscript <- R.home("bin/Rscript")
for(i in files){
    system2(rscript, shQuote(i), stdout = TRUE, wait = TRUE)
}
