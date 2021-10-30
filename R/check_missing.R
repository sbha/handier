is_missing <- function(x, m){
  if(missing(m)){
    missing_strs <- c('unknown', 'missing', '', 'null', 'na', 'nan', '-9', 'inf', '-inf')
  }
  
  ifelse((is.na(x) | is.null(x) | is.nan(x) | is.infinite(x)), TRUE, 
         ifelse(trimws(tolower(x)) %in% missing_strs, TRUE, FALSE))
}

# summarise_all(df, ~sum(is_missing(.)))
# summarise_all(df, ~(sum(is_missing(.) / nrow(df))))

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

# df <- data.frame(a = c(NA, '1', '  ', 'missing'),
#                  b = c(0, 2, NaN, 4),
#                  c = c('NA', 'b', '-9', 'null'),
#                  d = 1:4,
#                  e = c(1, Inf, -Inf, 0))
# check_missing_df(df)
# check_missing_df(df, TRUE)
# 
