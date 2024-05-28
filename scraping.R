## ---- scraping.R


library(rvest)


# Spotify
## Weekly chart totals

kworb_gwt <- read_html("https://kworb.net/spotify/country/global_weekly_totals.html")

td_elements <- kworb_gwt %>%
  html_elements("td")

extracted_text <- html_text2(td_elements)


## scraped data converted to data frame
### 7 columns
row_list <- NULL
current_row <- NULL
i <- 0

for(text in extracted_text){
  current_row <- append(current_row, text)
  
  
  if (i%%8 == 0){
    row_list <- append(row_list, current_row)
    current_row <- NULL
  }
  
  i <- i + 1
}