n <- as.integer(Sys.getenv("n", 100L))
nWorkers <- as.integer(Sys.getenv("nWorkers", 4L))
files <- list.files("R", full.names = TRUE)
files <- files[!grepl("runAll.R", files)]

for(i in files){
    source(i)
}
