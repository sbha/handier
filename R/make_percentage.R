

make_percentage <- function(numerator, denominator, digits = 1){
  round(numerator / denominator * 100, digits)
}