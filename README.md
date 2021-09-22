
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.338|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    36.437|                                0.93|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.326|                              103.68|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   119.439|                                0.28|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |    73.571|                                0.46|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |    77.871|                                0.43|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    81.024|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    81.291|                               99.67|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   153.046|                               52.94|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   213.133|                               38.02|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |   109.012|                               74.33|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |   107.848|                               75.13|

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

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-3.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-4.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-5.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-6.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-7.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-8.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-9.png)

## CPU intensive

```r
overheadFiles <- files[grepl(".+BiocParallel-cpu-", files)]
overHeadData <- readFileData(overheadFiles)
for(backend in overHeadData$backend){
curData <- overHeadData[overHeadData$backend == backend,]
makePlot(curData)
}
```

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-2.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-3.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-4.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-5.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-6.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-7.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-8.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-9.png)

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

