files <- list.files("R", full.names = TRUE)
rscript <- R.home("bin/Rscript")

for(i in files){
    system2(rscript, shQuote(i), stdout = TRUE, wait = TRUE)
}
