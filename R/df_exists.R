# handier
df_exists <- function(df, 
                      check_rows = FALSE, 
                      min_rows = 1){
  
  df_name <- deparse(substitute(df))
  
  if (exists(df_name) && is.data.frame(get(df_name))){ 
    
    if (check_rows){
      
      if (nrow(df) >= min_rows){
        
        TRUE
        
      } else {
        
        FALSE
        
      }
      
    } else {
      
      TRUE 
      
    }
    
  } else {
    
    FALSE 
    
  }
  
}

# https://stackoverflow.com/questions/20573119/check-if-data-frame-exists

# df123 <- ''
# df_i <- iris[iris$Species == 'stu',]
# 
# df_exists(iris)
# df_exists(df123)
# df_exists(df_i)
# df_exists(df_i, TRUE)
# 
# iris |> df_exists()


minimum_rows_check <- function(df, min_rows = 1){
  
  if (nrow(df) >= min_rows){
    
    TRUE
    
  } else {
    
    FALSE
    
  }
  
}

# minimum_rows_check(iris)