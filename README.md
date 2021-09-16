
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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.356|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    37.126|                                0.96|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.336|                              105.95|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   140.536|                                0.25|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    75.591|                                0.47|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   106.866|                                0.33|

# Overhead benchmark 2
In this benchmark we use the same setting except that n=100

```
#> Error in gzfile(file, "rb"): invalid 'description' argument
```


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
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |    84.900|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    85.808|                               98.94|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |   163.073|                               52.06|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   218.079|                               38.93|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |   111.391|                               76.22|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   111.751|                               75.97|




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

