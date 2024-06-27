check_sysenv_var <- function(var){
  
  os <- .Platform$OS.type
  
  path <- Sys.getenv(var)
  
  if (os == 'windows'){
    
    sort(unique(strsplit(path, ';')[[1]]))
    
  } else {
    
    sort(unique(strsplit(path, ':')[[1]]))
    
  }

}

check_sysenv_path <- function(var = 'PATH'){
  
  check_sysenv_var(var)
  
}


search_sysenv_path <- function(x){
  
  p <- check_sysenv_path()
  
  p[grepl(x, p)]
  
}



check_sysenv_exists <- function(env){
  
  if (Sys.getenv(env) != '') TRUE else FALSE
  
}


# ignore case
# search var names and values
# search_sysenv <- function(x){
#   
#   p <- check_sysenv_path()
#   
#   p[grepl(x, p)]
#   
# }

