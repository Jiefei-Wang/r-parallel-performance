
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead benchmark 1
This benchmark measures the overhead of the parallel functions. The function being evaluated is equivalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|source |package  |backend |version |call      | time(sec)| performance relative to baseline(%)|
|:------|:--------|:-------|:-------|:---------|---------:|-----------------------------------:|
|r-base |parallel |socket  |4.1.1   |parLapply |     0.348|                               100.0|
|r-base |base     |NA      |4.1.1   |lapply    |     0.373|                                93.3|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

|source |package  |backend |version |call      | time(sec)| performance relative to baseline(%)|
|:------|:--------|:-------|:-------|:---------|---------:|-----------------------------------:|
|r-base |parallel |socket  |4.1.1   |parLapply |     0.060|                                 100|
|r-base |base     |NA      |4.1.1   |lapply    |     0.006|                                1000|


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


|source |package  |backend |version |call      | time(sec)| performance relative to baseline(%)|
|:------|:--------|:-------|:-------|:---------|---------:|-----------------------------------:|
|r-base |parallel |socket  |4.1.1   |parLapply |    87.882|                              100.00|
|r-base |base     |NA      |4.1.1   |lapply    |   170.222|                               51.63|




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

