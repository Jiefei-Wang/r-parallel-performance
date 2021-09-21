
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.364|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    38.878|                                0.94|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.342|                              106.43|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |     6.497|                                5.60|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |     5.878|                                6.19|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |    84.038|                                0.43|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.055|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |     0.236|                               23.31|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.005|                             1100.00|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |     0.013|                              423.08|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |     0.095|                               57.89|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |     0.151|                               36.42|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    86.555|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    86.945|                               99.55|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   167.014|                               51.82|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.9  |bplapply  |   221.360|                               39.10|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.9  |bplapply  |   114.066|                               75.88|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.9  |bplapply  |   115.078|                               75.21|




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

