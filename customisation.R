## ---- customisation.R

library(magrittr) # Loading magrittr here to avoid function masking with other libraries


set_flextable_defaults(
  font.size = 10, theme_fun = theme_vanilla,
  padding = 6,
  background.color = "#EFEFEF")

theme_design <- function(x) {
  x <- border_remove(x)
  std_border <- fp_border_default(width = 4, color = "white")
  x <- fontsize(x, size = 10, part = "all")
  x <- font(x, fontname = "Courier", part = "all")
  x <- align(x, align = "center", part = "all")
  x <- bold(x, bold = TRUE, part = "all")
  x <- bg(x, bg = "#475f77", part = "body")
  x <- bg(x, bg = "#eb5555", part = "header")
  x <- bg(x, bg = "#1bbbda", part = "footer")
  x <- color(x, color = "white", part = "all")
  x <- padding(x, padding = 6, part = "all")
  x <- border_outer(x, part="all", border = std_border )
  x <- border_inner_h(x, border = std_border, part="all")
  x <- border_inner_v(x, border = std_border, part="all")
  x <- set_table_properties(x, layout = "fixed")
  x
}
