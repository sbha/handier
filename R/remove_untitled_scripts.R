# dir_proj <- '.Rproj.user/291098C5/sources/session-f9b366/'


remove_untitled_scripts <- function(
    dir_proj = '.Rproj.user/{pn}/sources/',
    dir_session = '.Rproj.user/{pn}/sources/{sn}/'
){
  
  # project name 
  # if multiple sessions exist, get the latest
  pn <- list.files('.Rproj.user/')
  pn <- pn[!str_detect(pn, 'shared')]
  
  dir_proj <- glue::glue(dir_proj)
  
  # session name
  sn <- list.files(dir_proj)
  sn <- sn[str_detect(sn, 'session-')]
  
  find_untitled <- function(fn){
    
    cat(fn, '\n')
    
    rj <- fromJSON(fn)
    tn <- pluck(rj, 'properties', 'tempName')
    
    if (!is.null(tn)){
      if (str_detect(tn, 'Untitled')){
        enframe(fn, NULL, 'untitled_file')
      } else {
        cat('ok!\n')
      }
    }
  }
  
  df_untitled <- 
    list.files(dir_proj, full.names = TRUE) %>% 
    enframe(NULL, 'file_name') %>% 
    filter(!str_detect(file_name, 'contents')) %>% 
    filter(!str_detect(file_name, 'lock_file')) %>% 
    pull(file_name) %>% 
    map_df(find_untitled)
  
  df_untitled %>% 
    map(file.remove)
  
}











