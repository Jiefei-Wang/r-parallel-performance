
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.351|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    49.728|                                0.71|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.384|                               91.41|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.17 |bplapply  |    18.005|                                1.95|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.17 |bplapply  |     7.624|                                4.60|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.17 |bplapply  |    83.173|                                0.42|


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    81.790|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    77.187|                              105.96|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   153.452|                               53.30|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.17 |bplapply  |   197.944|                               41.32|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.17 |bplapply  |   108.639|                               75.29|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.17 |bplapply  |   110.615|                               73.94|

# BiocParallel benchmark history
## Overhead



![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-2.png)![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-3.png)

## CPU intensive
![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-2.png)![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-3.png)

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

