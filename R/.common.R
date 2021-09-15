## Setting the package library
libPaths <- .libPaths()
if(!any(grepl(".r_packages", libPaths, fixed = TRUE))){
  cachePath <- normalizePath("~/.r_packages", mustWork = FALSE, winslash = "/")
  if(!dir.exists(cachePath))
    dir.create(cachePath, recursive = TRUE)
  libPaths <- c(cachePath, libPaths)
  .libPaths(libPaths)
  rm(cachePath, libPaths)
}


nOverhead <- as.integer(Sys.getenv("nOverhead", 100L))
nCpuBurn <- as.integer(Sys.getenv("nCpuBurn", 100L))
nMemBurn <- as.integer(Sys.getenv("nMemBurn", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))

benchFunc.overhead <- function(x) runif(1)
