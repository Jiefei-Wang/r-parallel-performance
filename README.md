
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead benchmark 1
This benchmark measures the overhead of the parallel functions. The function being evaluated is equivalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.377|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    58.113|                                0.65|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.525|                               71.81|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   193.045|                                0.20|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    93.461|                                0.40|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   135.804|                                0.28|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.068|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |     0.212|                               32.08|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.005|                             1360.00|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |     0.221|                               30.77|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |     0.214|                               31.78|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |     0.195|                               34.87|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    88.179|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    88.303|                               99.86|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   170.907|                               51.59|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   220.429|                               40.00|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |   113.375|                               77.78|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   112.278|                               78.54|




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

