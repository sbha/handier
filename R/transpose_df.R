transpose_df <- function(x){
  suppressWarnings(
    x %>% 
      rownames_to_column %>% 
      gather(var, value, -rowname) %>% 
      spread(rowname, value)
  )
}