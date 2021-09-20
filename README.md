
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.349|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    46.694|                                0.75|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.346|                              100.87|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   103.860|                                0.34|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |    62.670|                                0.56|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |    70.587|                                0.49|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.049|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |     0.259|                               18.92|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.004|                             1225.00|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |     0.093|                               52.69|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |     0.175|                               28.00|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |     0.152|                               32.24|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    83.905|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    83.975|                               99.92|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   162.364|                               51.68|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.8  |bplapply  |   209.291|                               40.09|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.8  |bplapply  |   107.897|                               77.76|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.8  |bplapply  |   108.238|                               77.52|




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

