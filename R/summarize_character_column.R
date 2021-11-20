summarize_character_column <- function(x){
  tibble(
    column_type = typeof(x),
    observations = length(x),
    missing = sum(is.na(x)),
    pct_missing = missing / observations,
    min_chars = min(nchar(x), na.rm = TRUE),
    median_chars = median(nchar(x), na.rm = TRUE),
    mean_chars = mean(nchar(x), na.rm = TRUE),
    max_chars = max(nchar(x), na.rm = TRUE)
    #word counts
  )
}
