is_defined <- function(sym) {
  sym <- deparse(substitute(sym))
  env <- parent.frame()
  exists(sym, env)
}

# https://stackoverflow.com/a/43446356/3058123

