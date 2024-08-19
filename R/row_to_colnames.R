row_to_colnames <- function(df, row = 1){
  
  df %>% 
    `colnames<-`(trimws(.[row, ])) %>%
    .[-row, ]
  
}