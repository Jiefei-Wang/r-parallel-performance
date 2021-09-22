
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.322|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    47.464|                                0.68|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.344|                               93.60|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   112.407|                                0.29|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |    68.526|                                0.47|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |    75.295|                                0.43|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    86.381|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    86.194|                              100.22|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   168.683|                               51.21|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   213.799|                               40.40|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |   110.861|                               77.92|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |   110.863|                               77.92|

# BiocParallel benchmark history
## Overhead




```r
files <- list.files("../results/history", full.names = TRUE)
overheadFiles <- files[grepl(".+BiocParallel-overhead-", files)]
overHeadData <- readFileData(overheadFiles)
for(backend in unique(overHeadData$backend)){
curData <- overHeadData[overHeadData$backend == backend,]
makePlot(curData, title = backend)
}
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-3.png)

## CPU intensive

```r
cpuFiles <- files[grepl(".+BiocParallel-cpu-", files)]
cpuData <- readFileData(cpuFiles)
for(backend in unique(cpuData$backend)){
curData <- cpuData[cpuData$backend == backend,]
makePlot(curData, title = backend)
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
#> [1] "Intel(R) Xeon(R) CPU E5-2673 v3 @ 2.40GHz"
#> 
#> $no_of_cores
#> [1] 2
benchmarkme::get_ram()
#> 7.29 GB
```

