move_file <- function(file_name,
                      #rename
                      from, 
                      to, 
                      remove = TRUE){
  
  from_path <- paste0(from, file_name)
  to_path <- paste0(to, file_name)
  
  todir <- dirname(to_path)
  
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  
  if (remove == TRUE) {
    
    file.rename(from = from_path,  to = to_path)
    
  } else {
    
    file.copy(from = from_path,  to = to_path)
    
  }
  
}


# https://stackoverflow.com/questions/10266963/moving-files-between-folders

