abbr_to_day <- function(x, ignore_case = TRUE){
  
  if (ignore_case) x <- str_to_title(x)
  
  da <- c('Mon', 'Tue', 'Tues', 'Wed', 'Weds', 'Thu', 'Thur', 'Thurs', 'Fri', 'Sat', 'Sun')
  dn <- c('Monday', 'Tuesday', 'Tuesday', 'Wednesday', 'Wednesday', 'Thursday', 'Thursday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
  dn[match(x, da)]
}

day_to_abbr <- function(x, 
                        abbr_shortest = TRUE, 
                        custom_abbr = NULL,
                        ignore_case = TRUE){
  
  if (ignore_case) x <- str_to_title(x)
  
  if (abbr_shortest){
    da <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun')
  } else {
    da <- c('Mon', 'Tues', 'Weds', 'Thurs', 'Fri', 'Sat', 'Sun')
  }
  
  if (!is.null(custom_abbr)){
    da <- custom_abbr
  }
  
  dn <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
  da[match(x, dn)]
}

# abbr_to_day('Tues')
# day_to_abbr('Tuesday')
# abbr_to_day('FRI')
# day_to_abbr('FRIDAY')
# day_to_abbr('Tuesday', custom_abbr = c('M', 'T', 'W', 'R', 'F', 'S', 'U'))
# 
# 
# day_names <- c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
# 
# day_names %>% 
#   map(day_to_abbr)
# 
# day_names %>% 
#   map(~day_to_abbr(., FALSE))
# 
# c('Mon', 'Tue', 'Tues', 'Wed', 'Weds', 'Thu', 'Thur', 'Thurs', 'Fri', 'Sat', 'Sun') %>% 
#   map(abbr_to_day)