calculate_table_percentage <- function(colname, as_decimal = FALSE){
  
  p <- colname / sum(colname)
  
  if (as_decimal == TRUE) {
    p
  } else {
    p * 100
  }
}

# starwars %>% count(species, sort = TRUE) %>% mutate(pct = calculate_table_percentage(n))


ctp <- function(df, 
                colname = 'n', 
                as_decimal = FALSE, 
                pct_name = 'pct', 
                include_cumsum = FALSE){
  
  df[[pct_name]] <- df[[colname]] / sum(df[[colname]])
  
  if (include_cumsum){
    
    df <- df %>% 
      mutate(csum = cumsum(df[[pct_name]]))
    
  }
  
  if (as_decimal) {
    
    df
    
  } else {
    
    df[[pct_name]] <- df[[pct_name]] * 100
    
    if (include_cumsum){
      
      df <- df %>% 
        mutate(csum = csum * 100)
      
    }
    
    df
  }
}

# starwars %>%
#   count(species, sort = TRUE) %>%
#   ctp
# 
# starwars %>% 
#   count(species, sort = TRUE) %>%
#   ctp('n', TRUE, 'percentage')

# starwars %>%
#   count(species, sort = TRUE, name = 'cnt') %>%
#   ctp('cnt', TRUE, 'percentage')

# https://stackoverflow.com/a/36015931/3058123

# starwars %>%
#   count(species, sort = TRUE) %>%
#   ctp(., include_cumsum = TRUE)