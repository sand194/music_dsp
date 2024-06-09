## ---- data_export.R

# Exporting all the data frames to csv files for easier use later

library(rio)


get_df_names <- function(dfs) {
  # Get all names from a list
  
  df_names <- names(dfs)
  
  
  return(df_names)
}


# List containing all of the data frames in Global Environment
data_frames <- ls() %>%
  set_names() %>%
  map(~ get(.)) %>%
  keep(is.data.frame)


data_frames_names <- get_df_names(data_frames)

# Save raw data frames to csv files
for (i in 1:length(data_frames_names)) {
  
  export_name <- paste("raw_data/", data_frames_names[i], ".csv", sep = "")
  
  export(data_frames[[i]], export_name)
  
}


# Saving url_list to csv
export(as.data.frame(url_list), "url_list.csv", col.names = F)


# Saving spotify_most_streamed_songs to csv
export(spotify_most_streamed_songs, "raw_data/spotify_most_streamed_songs.csv")
