## ---- data_import.R

# Importing all the data frames from raw_data folder


library(rio)


setwd("raw_data")

temp = list.files(pattern = "\\.csv$")
for (i in 1:length(temp)) {
  assign(temp[i], import(temp[i], format = "csv"))
}

setwd("..")


# List containing all of the data frames in Global Environment
data_frames <- ls() %>%
  set_names() %>%
  map(~ get(.)) %>%
  keep(is.data.frame)


# Cleaning newly imported data frames - removing ".csv" part from variable names
names(data_frames) <- gsub("\\.csv$", "", names(data_frames))

lapply(names(data_frames), function(name) {
  assign(name, data_frames[[name]], envir = .GlobalEnv)
  }
)


# Removing variables with ".csv" names from global environment
rm(list = grep("\\.csv$", ls(), value = TRUE), envir = .GlobalEnv)
