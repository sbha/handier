check_rprofile <- function(){
  # https://stackoverflow.com/questions/13735745/locate-the-rprofile-file-generating-default-options
  candidates <- c( Sys.getenv("R_PROFILE"),
                   file.path(Sys.getenv("R_HOME"), "etc", "Rprofile.site"),
                   Sys.getenv("R_PROFILE_USER"),
                   file.path(getwd(), ".Rprofile") )
  
  files <- Filter(file.exists, candidates)
  
  if (length(files) > 0) {
    return(files)
  } else {
    cat('no Rprofile exits')
  }
  
}