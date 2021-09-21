
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead benchmark
This benchmark measures the overhead of the parallel functions. The function being evaluated is equivalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.346|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    39.001|                                0.89|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.352|                               98.30|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |     6.726|                                5.14|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |     5.960|                                5.81|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |    85.548|                                0.40|


# CPU intensive benchmark
The function being evaluated is equivalent to

```r
lapply(1:n, function(x) {
    m <- 5000L
    value <- 0
    for(i in 1:m){
        value <- value + sum(sample(1:m, m))
    }
    value
})
```
where n=100. All parallel functions use its default setting.


|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    87.988|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    88.226|                               99.73|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   170.367|                               51.65|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |   226.231|                               38.89|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |   116.443|                               75.56|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |   117.370|                               74.97|

# BiocParallel benchmark history
## Overhead




```r
files <- list.files("../results/history", full.names = TRUE)
overheadFiles <- files[grepl(".+BiocParallel-overhead-", files)]
overHeadData <- readFileData(overheadFiles)
for(backend in overHeadData$backend){
curData <- overHeadData[overHeadData$backend == backend,]
makePlot(curData)
}
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-3.png)

## CPU intensive

```r
overheadFiles <- files[grepl(".+BiocParallel-cpu-", files)]
overHeadData <- readFileData(overheadFiles)
for(backend in overHeadData$backend){
curData <- overHeadData[overHeadData$backend == backend,]
makePlot(curData)
}
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-2.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-3.png)

## Host machine specification

```r
benchmarkme::get_cpu()
#> $vendor_id
#> [1] "GenuineIntel"
#> 
#> $model_name
#> [1] "Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz"
#> 
#> $no_of_cores
#> [1] 2
benchmarkme::get_ram()
#> 7.29 GB
```

