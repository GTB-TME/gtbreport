# gtbreport
version 0.2.1

Number formatting functions, colour palettes and ggplot2 theme for the WHO Global Tuberculosis Report the WHO Global Tuberculosis Report.

## Authors: 
Philippe Glaziou, Irwin Law, Hazim Timimi

## Installation:
devtools::install_github("GTB-TME/gtbreport")


## Examples:

ftb(23456)

[1] "23 500"

ftb(c(0.359, 0.00036))

[1] "0.36" "<0.01"

p <- ggplot(mtcars, aes(wt, mpg)) + geom_point() + facet_wrap(~ cyl)

print(p)

![image](https://user-images.githubusercontent.com/233963/121515214-3ba47d80-c9ed-11eb-8b07-176f3131b616.png)


p2 <- p + theme_gtb()

print(p2)

![image](https://user-images.githubusercontent.com/233963/121515261-4b23c680-c9ed-11eb-8ec5-5f36e3088ffe.png)

