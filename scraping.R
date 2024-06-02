## ---- scraping.R

library(tidyverse)
library(rvest)

source("url_list.R", echo = T, local = knitr::knit_global())



df_name_correction <- function(df, url){
  # Changes the name of given data frame for correct variable labeling
  
  df_name <- gsub("https://kworb.net", "", url)
  df_name <- gsub(".html", "", df_name)
  df_name <- gsub("/", "_", df_name)
  df_name <- sub("^_", "", df_name)
  
  
  assign(df_name, df, envir = .GlobalEnv)
  
}



auto_scraping <- function(url){
  # Automated web scraping of the pages with data
  # Creates correctly formated data frames
  
  ## column header class: "th"
  ## data row class: "td"
  
  
  ### Getting column headers
  columns <- read_html(url) %>%
    html_elements("th") %>%
    html_text2()
  
  
  ### Getting data rows
  rows <- read_html(url) %>%
    html_elements("td") %>%
    html_text2()
  
  
  ## Converting scrapped data into a data frame
  
  ### Creating empty data frame with correct dimensions to fill
  rows_df <- data.frame(matrix(ncol = length(columns), nrow = 0))
  rows_df_colnames <- columns
  
  
  current_row <- c()
  
  ### Filling in the data frame
  for (i in 1:length(rows)){
    
    if (i%%length(columns) == 0){
      current_row <- append(current_row, rows[i])
      
      rows_df <- rbind(rows_df, current_row)
      
      current_row <- c()
    }
    else{
      current_row <- append(current_row, rows[i])
    }
    
  }
  
  colnames(rows_df) <- rows_df_colnames
  
  
  return(rows_df)
  
}



# Iterating over the list of urls to create all of the needed data frames from scraped data
for (i in 1:length(url_list)){
  
  data <- auto_scraping(url_list[i])
  df_name_correction(data, url_list[i])
  
}

