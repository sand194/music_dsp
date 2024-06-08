## ---- cleaning.R


# library(tidyverse)



replace_global <- function(data_frame_list, dfs_affected_list){
  # Function to replace data frames in global envritonment, which names are given in a list (second argument)
  
  for (i in 1:length(data_frame_list)){
  
    for (j in 1:length(dfs_affected_list)){
      
      if (!is.null(dfs_affected_list[j]) == names(data_frame_list[i])){
        
        assign(dfs_affected_list[j], data_frame_list[[i]], envir = .GlobalEnv)
      }
    }
  }
  
}




dfs_affected <- c() # Vector with names of data frames that will be affected while removing "Pos" column

# Iterating through all data frames and removing "Pos" column where it is necessary
for (i in 1:length(data_frames)){
  
  current_df <- data_frames[[i]]
  
  
  if (grepl("Pos", colnames(current_df[1])) || colnames(current_df[1]) == ""){
   
    current_df <- current_df[-1]
   
    dfs_affected <- append(dfs_affected, names(data_frames[i]))
    
    data_frames[[i]] <- current_df
    
  }
 
}



# Replacing data frames in Global Environment, so we can use the clean ones
replace_global(data_frames, dfs_affected)
