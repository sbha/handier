is_missing <- function(x){
  missing_strs <- c('unknown', 'missing', '', 'null', 'na', 'nan', '-9', 'inf', '-inf')
  ifelse((is.na(x) | is.null(x) | is.nan(x) | is.infinite(x)), TRUE, 
         ifelse(trimws(tolower(x)) %in% missing_strs, TRUE, FALSE))
}

check_missing_df <- function(df, na_only = FALSE, digits = 1){
  if (na_only == TRUE){
    missing = summarise_all(df, ~sum(is.na(.)))
  } else {
    missing = summarise_all(df, ~sum(is_missing(.)))
  }
  
  missing %>% 
    mutate(field = 'count') %>% 
    select(field, everything()) %>% 
    gather(field, 'cnt_missing') %>% 
    mutate(p_missing = handier::make_percentage(cnt_missing, nrow(df), digits))
  
}


