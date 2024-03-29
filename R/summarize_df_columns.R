summarize_df_columns <- function(df, type = 'numeric'){
  
  if (type == 'numeric'){
    df %>% 
      select_if(is.numeric) %>% 
      map_df(~summarize_numeric_column(.), .id = 'column_name')
  } else if (type == 'character'){
    df %>% 
      #rownames_to_column() %>% 
      mutate_if(is.factor, as.character) %>% 
      select_if(is.character) %>% 
      map_df(~summarize_character_column(.), .id = 'column_name')
  } else if (type == 'date'){
    df %>% 
      select_if(is.instant) %>% 
      map_df(~summarize_date_column(.), .id = 'column_name')
  }

}
