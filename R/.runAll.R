source("R/.common.R")
print(.libPaths())
print(dir(.libPaths()[1]))

pkgs <- c("BiocManager", "knitr", "foreach", "doParallel", "benchmarkme", "remotes")
for(i in pkgs){
    if(!requireNamespace(i)){
        install.packages(i)
    }
}
BiocManager::install(version='devel', ask = FALSE, update = FALSE)
BiocManager::install("BiocParallel")
# Sys.unsetenv("GITHUB_PAT")
# Sys.unsetenv("GITHUB_TOKEN")
# remotes::install_github("Bioconductor/BiocParallel", auth_token = NULL)

# install.packages("BiocParallel_1.27.8.tar.gz", repos = NULL, type="source")


print(.libPaths())
print(dir(.libPaths()[1]))


files <- list.files("R", full.names = TRUE)
rscript <- R.home("bin/Rscript")
for(i in files){
    system2(rscript, shQuote(i), stdout = TRUE, wait = TRUE)
}
