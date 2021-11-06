summarize_df_columns <- function(df){
  
  df %>% 
    select_if(is.numeric) %>% 
    map_df(~summarize_numeric_column(.), .id = 'column_name')
  
}
