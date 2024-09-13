get_nth_day_of_month <- function(nth = 'first',
                                 d_name = 'Mon',
                                 d = Sys.Date()){
  
  nth_options <- c('first', 'second', 'third', 'fourth', 'last')
  
  if (!nth %in% nth_options){
    stop(glue::glue("'{nth}' is not a valid option for nth"))
  }
  
  #d_name <- handier::day_to_abbr(d_name)
  
  fd <- floor_date(Sys.Date(), "month")
  ld <- ceiling_date(Sys.Date(), "month") - 1
  
  seq(fd, length=day(ld), by='1 day') %>% 
    enframe(NULL, 'date') %>% 
    mutate(day = wday(date, label = TRUE)) %>% 
    group_by(day) %>% 
    mutate(day_order = row_number()) %>% 
    mutate(first_day = day_order == min(day_order)) %>% 
    mutate(last_day = day_order == max(day_order)) %>% 
    filter(
      if (nth == 'first'){
        day == d_name & day_order == 1
      } else if (nth == 'second'){
        day == d_name & day_order == 2
      } else if (nth == 'third'){
        day == d_name & day_order == 3
      } else if (nth == 'fourth'){
        day == d_name & day_order == 4
      } else if (nth == 'last'){
        day == d_name & day_order == max(day_order)
      }
    ) %>% 
    ungroup() %>% 
    select(date) %>% 
    unlist() %>% 
    unname() %>% 
    as.Date()
  
}

# get_nth_day_of_month('first')
# get_nth_day_of_month('last')
# 
# get_nth_day_of_month('first', 'Tue')
# get_nth_day_of_month('second', 'Tue')
# get_nth_day_of_month('third', 'Tue')
# get_nth_day_of_month('fourth', 'Tue')
# get_nth_day_of_month('last', 'Tue')