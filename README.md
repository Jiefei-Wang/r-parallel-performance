

# Introduction
test message


Table: n:100000, workers:16

|   |source                    |package      |backend        |call      | time(sec)| performance(%)|
|:--|:-------------------------|:------------|:--------------|:---------|---------:|--------------:|
|1  |r-base                    |parallel     |socket         |parLapply |     0.327|         100.00|
|8  |r-base                    |foreach      |doParallel     |foreach   |    33.020|           0.99|
|9  |r-base                    |base         |NA             |lapply    |     0.309|         105.83|
|2  |BiocManager               |BiocParallel |SerialParam    |bplapply  |   119.127|           0.27|
|3  |BiocManager               |BiocParallel |SnowParam      |bplapply  |    67.455|           0.48|
|4  |BiocManager               |BiocParallel |MulticoreParam |bplapply  |    97.584|           0.34|
|5  |Bioconductor/BiocParallel |BiocParallel |SerialParam    |bplapply  |   118.694|           0.28|
|6  |Bioconductor/BiocParallel |BiocParallel |SnowParam      |bplapply  |    68.008|           0.48|
|7  |Bioconductor/BiocParallel |BiocParallel |MulticoreParam |bplapply  |    95.489|           0.34|

