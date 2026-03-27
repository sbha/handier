

# '%PROGRAMDATA%\RStudio\rstudio-prefs.json'
# 
# list.files('~/.config/rstudio')
# 
# rj <- 

get_rstudio_prefs <- function(dir_path = '~/.config/rstudio/rstudio-prefs.json'){
  
  jsonlite::fromJSON(dir_path)
  
}