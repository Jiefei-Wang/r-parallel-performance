
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead measurement
This benchmark measures the overhead of the parallel functions. The function being evaluated is equivalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.334|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    35.660|                                0.94|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.321|                              104.05|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   120.127|                                0.28|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    80.778|                                0.41|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   121.906|                                0.27|

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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    73.714|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    73.914|                               99.73|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   143.209|                               51.47|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   189.956|                               38.81|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    97.706|                               75.44|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |    97.094|                               75.92|




## Host machine specification

```r
benchmarkme::get_cpu()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
benchmarkme::get_ram()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
```

