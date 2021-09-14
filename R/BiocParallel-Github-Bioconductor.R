if("BiocParallel" %in% loadedNamespaces()){
    rm(list = "p")
    gc()
    detach("package:BiocParallel", unload=TRUE)
}
BiocManager::install("BiocParallel", update = FALSE, ask = FALSE, force = TRUE)

pkgSource <- "Bioconductor/BiocParallel"
source("R/.BiocParallel-common.R")

saveRDS(table, "results/BiocParallel_Github_Bioconductor")
