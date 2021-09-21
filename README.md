
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.362|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    42.015|                                0.86|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.354|                              102.26|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |     8.067|                                4.49|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |     6.917|                                5.23|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |    69.061|                                0.52|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.054|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |     0.177|                               30.51|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.004|                             1350.00|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |     0.015|                              360.00|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |     0.094|                               57.45|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |     0.146|                               36.99|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    73.059|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    74.725|                               97.77|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   139.623|                               52.33|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |   180.223|                               40.54|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |    95.858|                               76.22|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |    96.783|                               75.49|




## Host machine specification

```r
benchmarkme::get_cpu()
#> $vendor_id
#> [1] "GenuineIntel"
#> 
#> $model_name
#> [1] "Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz"
#> 
#> $no_of_cores
#> [1] 2
benchmarkme::get_ram()
#> 7.29 GB
```

