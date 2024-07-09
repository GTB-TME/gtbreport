#' Round a number to the nearest integer and format according to WHO style guide
#'
#' Round a number to the nearest integer and format according to WHO style guide.
#' This means using non-breaking spaces as thousands separators, but don;t do that
#' for numbers between 1000 and 9999
#'
#'
#'
#' @param x A number to be rounded and spaced
#' @return A string
#' @examples
#' int_spacer(2.4)
#' int_spacer(24.5)
#' int_spacer(9876)
#' int_spacer(1234567.8)
#' int_spacer(c(123456, 7890123))
#'
#' @export
#'
int_spacer <- function(x) {

  stopifnot("Input must be numeric!" = !is.character(x))

  ifelse(is.na(x),
         NA,
         ifelse(round(x, 0) < 1e4,
                formatC(round(x, 0), big.mark = "", format = "d"),
                formatC(round(x, 0), big.mark = " ", format = "d")
         )
  )

}

