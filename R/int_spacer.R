#' Round a number to the nearest integer and
#' convert to a string with a non-breaking space
#' as the thousands separator. Do not use
#' the thousands separator for numbers less than ten thousand
#'
#' Also allows for the input to be a string containing a numeric
#'
#'
#' @param x A number to be rounded and spaced
#' @return A string
#' @examples
#' int_spacer(2.4)
#' int_spacer(24.5)
#' int_spacer(9876)
#' int_spacer(1234567.8)
#' int_spacer("123456789")
#'
#' @export
#'
int_spacer <- function(x) {

  #If input is a string containing a number (including decimal point if present),
  #convert it to numeric

  if (!is.na(x) & !is.numeric(x) & grepl("^[[:digit:]|.]+$", x) == TRUE) {
    x <- as.numeric(x)
  }


  ifelse(is.na(x) | !is.numeric(x),
         NA,
         ifelse(round(x, 0) < 1e4,
                formatC(round(x, 0), big.mark = "", format = "d"),
                formatC(round(x, 0), big.mark = " ", format = "d")
                )
         )
}
