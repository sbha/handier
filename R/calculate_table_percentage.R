calculate_table_percentage <- function(colname, as_decimal = FALSE){
  
  p <- colname / sum(colname)
  
  if (as_decimal == TRUE) {
    p
  } else {
    p * 100
  }
  
}

# starwars %>% count(species, sort = TRUE) %>% mutate(pct = calculate_table_percentage(n))
