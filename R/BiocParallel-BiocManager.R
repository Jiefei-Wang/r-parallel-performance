if(!requireNamespace("BiocManager"))
    install.packages("BiocManager")
if("BiocParallel" %in% loadedNamespaces()){
    rm(list = "p")
    gc()
    detach("package:BiocParallel", unload=TRUE)
}
BiocManager::install("BiocParallel", update = FALSE, ask = FALSE, force = TRUE)
if(!requireNamespace("knitr"))
    install.packages("knitr")

pkgSource <- "BiocManager"
source("R/.BiocParallel-common.R")

saveRDS(table, "results/BiocParallel_BiocManager")

