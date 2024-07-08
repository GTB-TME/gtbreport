#' Number formatter according to GTB rounding rules
#'
#' Formats vectors of numbers (<2 billion) as vectors of strings
#'
#' GTB rounding convention:
#'
#' - 0 is written as "0" (output "0")
#'
#' - values under 0.1 are written "<0.1" ("<0.1")
#'
#' - from 0.1 to under 1 are rounded to 2 significant figures (0.NN)
#'
#' - from 1 to under 10 are rounded to 2 significant figures ("N.N")
#'
#' - 10 to under 100 are rounded to 2 significant figures ("NN")
#'
#' - 100 to under 1000 are rounded to 3 significant figures ("NNN")
#'
#' - 1000 to under 10000 are rounded to 3 significant figures ("NNN0")
#'
#' - 10000 upwards are rounded to 3 significant figures, with non-breaking space as thousands separator ("NNN0 000")
#'
#' - data that are not reported, but could be are represented
#'   as empty cells and should be accompanied by a footnote.
#'
#' - data that cannot be calculated, either because of missing
#'   data, data was not requested, or any other reason are represented
#'   with an en-dash, including when a number is greater than the limit
#'   of 32-bit integers, i.e. 2e9.
#'
#'
#' @param x Vector of numbers
#' @returns Vector of strings with the same length as the input
#' @examples
#' ftb(3488381)
#' ftb(c(12345, 987.23, 100, 15.678, 10, 3.598, 1, 0.359, 0.1, 0.036))
#' ftb(NA)
#' ftb(987654321987)
#'
#' # Input must be numeric
#' try(ftb("blah"))
#'
#' @export
#'
ftb <- Vectorize(function(x) {
  # formatter according to GTB rounding rules
  #' @param x vector of values
  #' @export
  stopifnot("Input must be numeric!" = !is.character(x))

  fstring = "–"

  if (!is.na(x) & is.numeric(x) & x < 2e9) {

    fstring <-  ifelse(x==0,
                       "0",
                       ifelse(signif(x, 1) < 0.1,
                              "<0.1",
                              ifelse(signif(x, 2) < 1,
                                     formatC(signif(x,2), format="f", digits=2),
                                     ifelse(signif(x, 2) < 10,
                                            formatC(signif(x,2), format="f", digits=1),
                                            ifelse(signif(x, 3) < 100,
                                                   formatC(signif(x, 2), big.mark="", format="d"),
                                                   ifelse(signif(x, 3) < 1e4,
                                                          formatC(signif(x, 3), big.mark="", format="d"),
                                                          formatC(signif(x, 3), big.mark=" ", format="d")
                                                          )
                                                   )
                                            )
                                     )
                              )
                       )

  }

  return(fstring)
}, 'x')




