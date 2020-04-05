# handier
Handy R functions

## Installation
``` r
# install.packages("devtools")
devtools::install_github("sbha/handier")
```

Check a data frame for different types of missing data other than just `NA` with `is_missing()`. Use `dplyr::summarise_all(df, ~sum(is_missing(.)))` to get a count of missing values by column or `dplyr::summarise_all(df, ~(sum(is_missing(.) / nrow(df))))` to get the percentage missing by column. 


Search for rprofiles with `check_rprofile()`.