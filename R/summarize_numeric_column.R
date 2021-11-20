summarize_numeric_column <- function(x){
  tibble(
    # column = quo_name(enquo(x)),
    column_type = typeof(x),
    observations = length(x),
    complete = sum(!is.na(x)),
    missing = sum(is.na(x)),
    pct_missing = missing / observations,
    min = min(x, na.rm = TRUE),
    median = median(x, na.rm = TRUE),
    mean = mean(x, na.rm = TRUE),
    max = max(x, na.rm = TRUE)
  ) 
}