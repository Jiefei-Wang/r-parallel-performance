

# Introduction
test message


Table: n:100000, workers:16

|source      |package      |backend   |call      | time(sec)| performance(%)|
|:-----------|:------------|:---------|:---------|---------:|--------------:|
|r-base      |parallel     |socket    |parLapply |     0.322|     100.000000|
|BiocManager |BiocParallel |SnowParam |bplapply  |    68.891|       0.467405|
|r-base      |base         |NA        |lapply    |     0.301|     106.976744|

