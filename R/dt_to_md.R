df_to_md <- function(x){
  # test if data frame
  cat(
    paste('|', paste(names(x), collapse = ' | '), '|\n'),
    paste0('|', paste(rep('---|', ncol(x)), collapse = ''), '\n'),
    x %>% 
      #as_tibble() %>% 
      #slice(1:5) %>% 
      mutate(md_start = '|') %>% 
      mutate(md_end = '|') %>% 
      unite(md_middle, mpg:carb, sep = ' | ') %>% 
      select(md_start, md_middle, md_end) %>% 
      unite(md, md_start:md_end, sep = ' ') %>% 
      unlist() %>% 
      paste(collapse = '\n'),
    sep = ''
  )
}

