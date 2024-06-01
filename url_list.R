## ---- url_list.R

library(rio)


url_list <- c(
  
  # Spotify
  ## Daily, weekly with totals
  
  ### Global
  "https://kworb.net/spotify/country/global_weekly.html",
  "https://kworb.net/spotify/country/global_weekly.html",
  "https://kworb.net/spotify/country/global_daily_totals.html",
  "https://kworb.net/spotify/country/global_weekly_totals.html",
  
  ### USA
  "https://kworb.net/spotify/country/us_daily.html",
  "https://kworb.net/spotify/country/us_weekly.html",
  "https://kworb.net/spotify/country/us_daily_totals.html",
  "https://kworb.net/spotify/country/us_weekly_totals.html",
  
  ### GB
  "https://kworb.net/spotify/country/gb_daily.html",
  "https://kworb.net/spotify/country/gb_weekly.html",
  "https://kworb.net/spotify/country/gb_daily_totals.html",
  "https://kworb.net/spotify/country/gb_weekly_totals.html",
  
  ### PL
  "https://kworb.net/spotify/country/pl_daily.html",
  "https://kworb.net/spotify/country/pl_weekly.html",
  "https://kworb.net/spotify/country/pl_daily_totals.html",
  "https://kworb.net/spotify/country/pl_weekly_totals.html",
  
  ## Most streamed artists of all time
  "https://kworb.net/spotify/artists.html",
  
  ## Top artists by monthly listeners right now (since march 1st 2023)
  "https://kworb.net/spotify/listeners.html",
  
  ## Most streamed songs (and albums)
  "https://kworb.net/spotify/toplists.html",
  
  
  
  # iTunes
  
  ## Sales
  
  ### US
  "https://kworb.net/pop/",
  
  ### UK
  "https://kworb.net/popuk/",
  
  
  ## Worldwide Songs
  "https://kworb.net/ww/",
  "https://kworb.net/ww/totals.html",
  "https://kworb.net/ww/artisttotals.html",
  
  ## Worldwide Albums
  "https://kworb.net/aww/",
  "https://kworb.net/aww/totals.html",
  "https://kworb.net/aww/artisttotals.html",
  
  ## European Songs
  "https://kworb.net/eu/",
  "https://kworb.net/eu/totals.html",
  "https://kworb.net/eu/artisttotals.html",
  
  ## European Albums
  "https://kworb.net/eua/",
  "https://kworb.net/eua/totals.html",
  "https://kworb.net/eua/artisttotals.html",
  
  
  
  # Apple Music (worldwide section)
  
  ## Worldwide Songs
  "https://kworb.net/apple_songs/",
  "https://kworb.net/apple_songs/totals.html",
  "https://kworb.net/apple_songs/artisttotals.html",
  
  ## Worldwide Albums
  "https://kworb.net/apple_albums/",
  "https://kworb.net/apple_albums/totals.html",
  "https://kworb.net/apple_albums/artisttotals.html",
  
  ## European Songs
  "https://kworb.net/apple_songs_eu/",
  "https://kworb.net/apple_songs_eu/totals.html",
  "https://kworb.net/apple_songs_eu/artisttotals.html",
  
  ## European Albums
  "https://kworb.net/apple_albums_eu/",
  "https://kworb.net/apple_albums_eu/totals.html",
  "https://kworb.net/apple_albums_eu/artisttotals.html",
  
  
  
  # YouTube
  ## Latest
  
  ### All 
  "https://kworb.net/youtube/",
  
  ### English
  "https://kworb.net/youtube/realtime_anglo.html",
  
  ## Most viewed music videos of all time
  "https://kworb.net/youtube/topvideos.html",
  
  ## Most viewed artists
  "https://kworb.net/youtube/archive.html",
  
  ## Weekly charts (aka countries)
  "https://kworb.net/youtube/insights/",
  
  ## Trending
  
  ### Overall
  "https://kworb.net/youtube/trending.html",
  
  ### Music
  "https://kworb.net/youtube/trending_music.html",
  
  ### Local
  "https://kworb.net/youtube/trending_local.html",
  
  ### Incl. Non-Music
  "https://kworb.net/youtube/trending_overall.html",
  
  ### Per Country
  "https://kworb.net/youtube/trending_countries.html",
  
  
  
  # Charts
  
  ## Current global artist ranking
  "https://kworb.net/itunes/",
  
  ## Charts (songs)
  "https://kworb.net/charts/",
  
  ## Charts (albums)
  "https://kworb.net/charts/index_a.html"
  
)


# Saving url_list to csv
export(as.data.frame(url_list), "url_list.csv", col.names = F)
