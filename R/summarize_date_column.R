summarize_date_column <- function(x){
  tibble(
    column_type = typeof(x),
    observations = length(x),
    complete = sum(!is.na(x)),
    missing = sum(is.na(x)),
    pct_missing = missing / observations,
    distinct = length(unique(x)),
    pct_distinct = distinct / observations,
    min_date = min(x, na.rm = TRUE),
    max_date = max(x, na.rm = TRUE),
    range_days = max_date - min_date
  )
}