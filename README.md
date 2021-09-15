
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead measurement
This benchmark measures the overhead of the parallel functions. The function be evaluated is equavalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

```
#> Error in gzfile(file, "rb"): invalid 'description' argument
```

## Host machine specification

```r
benchmarkme::get_cpu()
#> $vendor_id
#> [1] "AuthenticAMD"
#> 
#> $model_name
#> [1] "AMD Ryzen 7 5800H with Radeon Graphics"
#> 
#> $no_of_cores
#> [1] 16
benchmarkme::get_ram()
#> 14.9 GB
```

