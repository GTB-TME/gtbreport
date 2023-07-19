#' Colour palettes for variables that appear in multiple charts in the
#' WHO Global TB Report
#'
#' @param var_name Name of the variable being plotted
#' @return A hexadecimal colour code, or an empty string if var_name was not recognised.
#' @author: Hazim Timimi
#' @examples
#' p <- ggplot2::ggplot(mtcars, aes(wt, mpg)) +
#'
#'               geom_point(size = 3, colour = palette_gtb("inc")) +
#'
#'               theme_gtb()
#' print(p)
#'
#' @note var_name is not case sensitve. It must be one of:
#'
#' TB burden estimates:
#'
#' - "inc"    (incidence)
#'
#' - "inch"   (HIV-positive incidence)
#'
#' - "mort"   (mortality)
#'
#'
#'
#' Disaggregation by sex:
#'
#' - "female"
#'
#' - "male"
#'
#'
#'
#' Disaggregated by WHO region:
#'
#' - "afr"
#'
#' - "amr"
#'
#' - "emr"
#'
#' - "eur"
#'
#' - "sear"
#'
#' - "wpr"
#'
#'
#'
#' Treatment outcomes:
#'
#' - "succ"   (treatment success)
#'
#' - "fail"   (treatment failure)
#'
#' - "died"   (died)
#'
#' - "ltfu"   (lost to follow-up)
#'
#' - "neval"  (not evaluated)
#'
#' - "no_outcomes" (no outcomes data reported)
#'
#' @import ggplot2
#' @export
#'

palette_gtb <- function(var_name){

  if(!is.character(var_name) | is.na(var_name))  return("");

  switch(tolower(var_name),

        # --------------------------------------------
        # Colours for TB burden estimates
        # --------------------------------------------

        # incidence: green
        "inc" = "#91A93E",

        # incidence (HIV-positive): pinky red
        "inch" = "#ED1D24",

        # mortality (HIV-negative): light blue
        "mort" = "#1D91D1",

        # --------------------------------------------
        # Colours for sex-disaggregated charts,now based on
        # https://apps.who.int/gho/data/design-language/design-system/colors/
        # --------------------------------------------

        # incidence or notifications in females: purple
        "female" = "#6363c0",

        # incidence or notifications in males: orange
        "male" = "#f4a81d",

        # --------------------------------------------
        # Colours for region-disaggregated charts,now based on
        # https://apps.who.int/gho/data/design-language/design-system/colors/
        # --------------------------------------------

        # African Region: purple
        "afr" = "#6363c0",

        # Region of the Americas: orange
        "amr" = "#f26829",

        # Eastern Mediterranean Region: light purple
        "emr" = "#bd53bd",

        # European Region: light blue
        "eur" = "#008dc9",

        # South-East Asia Region: green
        "sea" = "#40bf73",

        # South-East Asia Region: green
        # (Second version in case code SEAR used)
        "sear" = "#40bf73",

        # Western Pacific Region: light orange
        "wpr" = "#f4a81d",

        # --------------------------------------------
        # Colours for treatment outcome charts
        # --------------------------------------------

        # Treatment Success (green)
        "succ" = "#009E73",

        # Treatment failure (red)
        "fail" = "#ED1D24",

        # Died (orange)
        "died" = "#F7941E",

        # Lost to follow-up (yellow)
        "ltfu" = "#E5DDB3",

        # Not evaluated (gray)
        "neval" = "#D1D3D4",

        # No data for treatment outcomes (darker gray)
        "no_outcomes" = "#888888",

        # If no match then return an empty string
        ""
  )
}
