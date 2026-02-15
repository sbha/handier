# handier
Handy R functions

## Installation
``` r
# install.packages("devtools")
devtools::install_github("sbha/handier")
```


## Usage

Check a data frame for different types of missing data other than just `NA` with `is_missing()`. Default is to check for `is.na()`, `is.null()`, `is.nan()`, `is.infinite()` and string values `'unknown'`, `'missing'`, `''`, '`null'`, `'na'`, `'nan'`, `'-9'`, `'inf'`, `'-inf'` Use `dplyr::summarise_all(df, ~sum(is_missing(.)))` to get a count of missing values by column or `dplyr::summarise_all(df, ~(sum(is_missing(.) / nrow(df))))` to get the percentage missing by column. 


Search for rprofiles with `check_rprofile()`.

Print a dataframe as a simple markdown table `df_to_md(mtcars[1:5,])`:

| mpg | cyl | disp | hp | drat | wt | qsec | vs | am | gear | carb |
|---|---|---|---|---|---|---|---|---|---|---|
| 21 | 6 | 160 | 110 | 3.9 | 2.62 | 16.46 | 0 | 1 | 4 | 4 |
| 21 | 6 | 160 | 110 | 3.9 | 2.875 | 17.02 | 0 | 1 | 4 | 4 |
| 22.8 | 4 | 108 | 93 | 3.85 | 2.32 | 18.61 | 1 | 1 | 4 | 1 |
| 21.4 | 6 | 258 | 110 | 3.08 | 3.215 | 19.44 | 1 | 0 | 3 | 1 |
| 18.7 | 8 | 360 | 175 | 3.15 | 3.44 | 17.02 | 0 | 0 | 3 | 2 |


Summarize numeric columns in a dataframe `summarize_df_columns(mtcars)`

| column_name | column_type | observations | missing | pct_missing | min | median | mean | max |
|---|---|---|---|---|---|---|---|---|
| mpg | double | 32 | 0 | 0 | 10.4 | 19.2 | 20.090625 | 33.9 |
| cyl | double | 32 | 0 | 0 | 4 | 6 | 6.1875 | 8 |
| disp | double | 32 | 0 | 0 | 71.1 | 196.3 | 230.721875 | 472 |
| hp | double | 32 | 0 | 0 | 52 | 123 | 146.6875 | 335 |
| drat | double | 32 | 0 | 0 | 2.76 | 3.695 | 3.5965625 | 4.93 |
| wt | double | 32 | 0 | 0 | 1.513 | 3.325 | 3.21725 | 5.424 |
| qsec | double | 32 | 0 | 0 | 14.5 | 17.71 | 17.84875 | 22.9 |
| vs | double | 32 | 0 | 0 | 0 | 0 | 0.4375 | 1 |
| am | double | 32 | 0 | 0 | 0 | 0 | 0.40625 | 1 |
| gear | double | 32 | 0 | 0 | 3 | 4 | 3.6875 | 5 |
| carb | double | 32 | 0 | 0 | 1 | 2 | 2.8125 | 8 |
