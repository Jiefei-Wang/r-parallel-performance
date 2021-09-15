
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead measurement
This benchmark measures the overhead of the parallel functions. The function being evaluated is equivalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|source |package  |backend |version |call      | time(sec)| performance relative to baseline(%)|
|:------|:--------|:-------|:-------|:---------|---------:|-----------------------------------:|
|r-base |parallel |socket  |4.1.1   |parLapply |     0.348|                              100.00|
|r-base |base     |NA      |4.1.1   |lapply    |     0.303|                              114.85|

# CPU intensive benchmark
The function being evaluated is equivalent to

```r
lapply(1:n, function(x) {
    m <- 10000L
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
|r-base |parallel |socket  |4.1.1   |parLapply |   322.959|                               100.0|
|r-base |base     |NA      |4.1.1   |lapply    |   595.813|                                54.2|




## Host machine specification

```r
benchmarkme::get_cpu()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
benchmarkme::get_ram()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
```

