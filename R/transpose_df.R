transpose_df <- function(x, r = NULL){# , v = 'var'
  #var <- enquo(v)
  
  if (is.null(r)) {
    
    suppressWarnings(
      x %>% 
        rownames_to_column() %>% 
        gather(var, value, -rowname) %>% 
        spread(rowname, value) #%>% filter(var != !!var) 
    ) 
    
  } else if (!is.null(r)) {
    r <- enquo(r)
  
    suppressWarnings(
      x %>%
        gather(var, value, -!!r) %>%
        spread(!!r, value) #%>% filter(var != !!var)
    )
    
  }
  
}



