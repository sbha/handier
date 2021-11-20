summarize_character_column <- function(x){
  #original_type <- typeof(x)
  #original_class = class(x)
  x <- as.character(x)
  
  tibble(
    column_type = typeof(x),
    observations = length(x),
    complete = sum(!is.na(x)),
    missing = sum(is.na(x)),
    pct_missing = missing / observations,
    min_chars = min(nchar(x), na.rm = TRUE),
    median_chars = median(nchar(x), na.rm = TRUE),
    mean_chars = mean(nchar(x), na.rm = TRUE),
    max_chars = max(nchar(x), na.rm = TRUE)
    #word counts?
  )
}
