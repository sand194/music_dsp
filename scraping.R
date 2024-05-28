## ---- scraping.R


library(rvest)


# Spotify
## Weekly chart totals

url <- "https://kworb.net/spotify/country/global_weekly_totals.html"
kworb_gwt <- read_html(url)

kworb_gwt %>%
  html_elements("td")
