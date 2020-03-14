is_missing <- function(x){
  missing_strs <- c('unknown', 'missing', '', 'null', 'na', 'nan', '-9', 'inf', '-inf')
  ifelse((is.na(x) | is.null(x) | is.nan(x) | is.infinite(x)), TRUE, 
         ifelse(trimws(tolower(x)) %in% missing_strs, TRUE, FALSE))
}