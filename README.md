
# Introduction
This is a benchmark for the popular parallel packages `parallel`, `foreach` and `BiocParallel`. The source code for generating the benchmark result is available at the branch `source`.


# Overhead measurement
This benchmark measures the overhead of the parallel functions. The function be evaluated is equavalent to

```r
lapply(1:n, function(x) runif(1))
```
where n=100000. All parallel functions use its default setting. Below is the table for the time consumption. 16 workers are used for each cluster(Note that the host may not have 16 CPUs)

|   |source             |package      |backend        |version |call      | time(sec)| performance relative to baseline(%)|
|:--|:------------------|:------------|:--------------|:-------|:---------|---------:|-----------------------------------:|
|1  |r-base             |parallel     |socket         |4.1.1   |parLapply |     0.371|                              100.00|
|5  |r-base             |foreach      |doParallel     |1.0.16  |foreach   |    38.572|                                0.96|
|6  |r-base             |base         |NA             |4.1.1   |lapply    |     0.339|                              109.44|
|2  |BioConductor-devel |BiocParallel |SerialParam    |1.27.7  |bplapply  |   145.371|                                0.26|
|3  |BioConductor-devel |BiocParallel |SnowParam      |1.27.7  |bplapply  |    76.072|                                0.49|
|4  |BioConductor-devel |BiocParallel |MulticoreParam |1.27.7  |bplapply  |   113.094|                                0.33|

## Host machine specification

```r
benchmarkme::get_cpu()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
benchmarkme::get_ram()
#> Error in loadNamespace(x): there is no package called 'benchmarkme'
```

