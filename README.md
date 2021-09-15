
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
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    39.474|                                0.85|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.348|                               95.98|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   136.015|                                0.25|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    76.804|                                0.43|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   109.769|                                0.30|

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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    87.742|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    88.087|                               99.61|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   170.549|                               51.45|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   226.713|                               38.70|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |   116.317|                               75.43|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   115.329|                               76.08|




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

