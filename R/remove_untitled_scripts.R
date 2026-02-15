# dir_proj <- '.Rproj.user/291098C5/sources/session-f9b366/'


remove_untitled_scripts <- function(
    delete_files = FALSE,
    dir_proj = '.Rproj.user/{pn}/sources/',
    dir_session = '.Rproj.user/{pn}/sources/{sn}/',
    prompt_interactive = TRUE,
    ...
){
  
  # project name 
  # if multiple sessions exist, get the latest
  pn <- list.files('.Rproj.user/')
  pn <- pn[!str_detect(pn, 'shared')]
  
  dir_proj <- glue::glue(dir_proj)
  
  # session name
  sn <- list.files(dir_proj)
  sn <- sn[str_detect(sn, 'session-')]
  
  dir_session <- glue::glue(dir_session)
  
  find_untitled <- function(fn){
    
    cat(fn, '\n')
    
    rj <- fromJSON(fn)
    p <- pluck(rj, 'path')
    pp <- pluck(rj, 'project_path')
    
    if (is.null(p) && is.null(pp)){
        enframe(fn, NULL, 'untitled_file')
      } else {
        cat('ok!\n')
      }
    }
  
  df_untitled <- 
    list.files(dir_session, full.names = TRUE) %>% 
    enframe(NULL, 'file_name') %>% 
    filter(!str_detect(file_name, 'contents')) %>% 
    filter(!str_detect(file_name, 'lock_file')) %>% 
    pull(file_name) %>% 
    map_df(find_untitled)
  
  
  if (prompt_interactive && base::interactive()){
    response <- menu(
      c("No", "Yes"), 
      title=glue::glue("Do you want to delete the following {nrow(df_untitled)} untitled files?\n {paste(df_untitled$untitled_file, collapse = ', ')}")
      )
    if (response == 2){
      delete_files <- TRUE
    } else {
      delete_files <- FALSE
    } 
  }
  
  if (delete_files){
    df_untitled %>% 
      map(file.remove)
  } else {
    message('delete files set to FALSE. {nrow(df_untitled)} files not deleted')
    df_untitled
  }
}











