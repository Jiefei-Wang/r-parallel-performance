## Setting the package library
# libPaths <- .libPaths()
# if(!any(grepl(".r_packages", libPaths, fixed = TRUE))){
#   cachePath <- normalizePath("~/.r_packages", mustWork = FALSE, winslash = "/")
#   if(!dir.exists(cachePath))
#     dir.create(cachePath, recursive = TRUE)
#   libPaths <- c(cachePath, libPaths)
#   .libPaths(libPaths)
#   rm(cachePath, libPaths)
# }


nOverhead <- as.integer(Sys.getenv("nOverhead", 10L))
nCpu <- as.integer(Sys.getenv("nCpu", 10L))
nMem <- as.integer(Sys.getenv("nMem", 10L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 2L))

benchFunc.overhead <- function(x) runif(1)
benchFunc.cpu <- function(x) {
    m <- 5000L
    value <- 0
    for(i in 1:m){
        value <- value + sum(sample(1:m, m))
    }
    value
}

if(!dir.exists("results/overhead")){
  dir.create("results/overhead", recursive = TRUE)
}
if(!dir.exists("results/cpu")){
  dir.create("results/cpu", recursive = TRUE)
}

if(!dir.exists("results/history")){
  dir.create("results/history", recursive = TRUE)
}
