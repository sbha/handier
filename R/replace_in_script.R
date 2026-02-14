replace_in_script <- function(
    file_name, 
    file_path, 
    find_str, 
    replace_str,
    use_fixed_re = FALSE,
    ignore_str_case = FALSE,
    replace_function = 'first',
    ...
    ){
  
  srf <- switch(replace_function,
                'first' = str_replace,
                'all' = str_replace_all,
                str_replace)
  
  
  f <- glue::glue('{file_path}{file_name}')
  
  if (file.exists(f)){
    
    message(file_name)
    
    script_file <- readLines(f)
    if (use_fixed_re){
      if (any(str_detect(script_file, fixed(find_str)))){
        script_file <- srf(script_file, fixed(find_str), replace_str)
      } else {
        message(glue::glue('{find_str} does not exist in {file_name}'))
      }
    } else {
      if (any(str_detect(script_file, regex(find_str, fixed = ignore_str_case)))){
        script_file <- srf(script_file, regex(find_str, fixed = ignore_str_case), replace_str)
      } else {
        message(glue::glue('{find_str} does not exist in {file_name}'))
      }
    }
    
    writeLines(script_file, f)
    
  } else {
    message(file_name, 'does not exist in', file_path)
  }
  
}
