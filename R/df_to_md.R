df_to_md <- function(x){
  # test if data frame
  # na handling
  cat(
    paste('|', paste(names(x), collapse = ' | '), '|\n'),
    paste0('|', paste(rep('---|', ncol(x)), collapse = ''), '\n'),
    x  %>% 
      unite(md_middle, everything(), sep = ' | ') %>% 
      mutate(md_start = '|') %>% 
      mutate(md_end = '|') %>% 
      select(md_start, md_middle, md_end) %>% 
      unite(md, md_start:md_end, sep = ' ') %>% 
      unlist() %>% 
      paste(collapse = '\n'),
    sep = ''
  )
}

# :----
# :---:
# ----:
# https://stackoverflow.com/questions/38539654/how-to-know-if-the-data-is-a-list-or-data-frame-in-r

# starwars %>% 
#   glimpse
# 
# nt <- map(starwars, class)
# nt <- sapply(starwars, class)