rename_file <- function(file_name, to_replace, replace_with){
  
  file.rename(file_name, str_replace(file_nam, to_replace, replace_with))
  
}

# list.files('./dirpath/', '.R', full.names = TRUE) %>% 
#   map(~rename_file(., '_shortname_', '_longname_'))

rename_dir_files <- function(dir, re_matching = '*', to_replace, replace_with){

  list.files(dir, re_matching, full.names = TRUE) %>%
    map(~rename_file(., to_replace, replace_with))

}


