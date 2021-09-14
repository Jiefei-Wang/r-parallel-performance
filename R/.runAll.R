pkgs <- c("BiocManager", "knitr", "foreach", "doParallel", "benchmarkme", "remotes")
for(i in pkgs){
    if(!requireNamespace(i)){
        install.packages(i)
    }
}
BiocManager::install('Bioconductor/BiocParallel', ask = FALSE, update = TRUE)


files <- list.files("R", full.names = TRUE)
rscript <- R.home("bin/Rscript")
for(i in files){
    system2(rscript, shQuote(i), stdout = TRUE, wait = TRUE)
}
