## ---- plots.R

# Functions to create and store customized plots

bar_plot <- function(df, fill_color, title, name) {
 # Bar plot visualizing most listened genres and assign them to variables
 plot <- ggplot(
  head(df),
  aes(
    x = reorder(Genre, -n),
    y = n)
  ) + geom_bar(
    stat = "identity",
    width = 0.5,
    fill = fill_color
    ) + labs(
      title = title,
      subtitle = "Globalnie"
    ) + xlab(
      ""
      ) + ylab(
        ""
      ) + theme_fivethirtyeight() + scale_fill_fivethirtyeight() + theme(
        plot.title = element_text(size = 13),
        plot.subtitle = element_text(size = 10)
     )
 
  assign(name, plot, envir = .GlobalEnv)
}



bubble_plots <- function(join_df, total_column, fill_color, title, name) {
  
    
  df <- join_df %>%
    select(Artist, {{total_column}}) %>%
    top_n(100, wt = {{total_column}})
  
  # separate top artists for labeling
  top_labels <- df %>%
    top_n(20, wt = {{total_column}})
  
  bot_labels <- df %>%
    top_n(-18, wt = {{total_column}})
  
  mid_labels <- df %>%
    slice(21:(nrow(df) - 18))
  
  
  
  plot <- df %>%
    ggplot(
      aes(x = Artist, y = {{total_column}}, size = log({{total_column}}))) +
      geom_point(aes(alpha = {{total_column}}), color = "#7e7b77", fill = fill_color, shape = 21) +
      labs(
        title = title,
        subtitle = "Globalnie - sumaryzacja"
      ) +
      xlab("Artysta") +
      ylab("Ilość streamów") +
      scale_size(range = c(1, 20)) +
      scale_alpha_continuous(range = c(0.3, 1)) +
      scale_y_log10() +
      theme_fivethirtyeight() + scale_fill_fivethirtyeight() + 
      theme(
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        legend.position = "none",
        panel.grid.major = element_line(color = "grey90", linewidth = 0.5),
        panel.grid.minor = element_line(color = "grey95", linewidth = 0.25),
        plot.title = element_text(size = 13),
        plot.subtitle = element_text(size = 10)
      ) +
      geom_text(
        data = top_labels,
        aes(label = Artist),
        vjust = 0.5, 
        hjust = 0.5,
        size = 2.5,
        color = "#1b2322"
      )
    

# TODO zrepelować tylko te labely które trzeba

  plot_interactive <- ggplotly(df %>%
    ggplot(aes(x = Artist, y = {{total_column}}, size = log({{total_column}}))) +
    geom_point(aes(alpha = {{total_column}}), color = "#7e7b77", fill = fill_color, shape = 21) +
    xlab("Artysta") +
    ylab("Ilość streamów") +
    labs(
      title = title,
      subtitle = "Globalnie - wersja interaktywna"
    ) +
    scale_size(range = c(3, 15), name = "Sum of Listeners/Views") +
    scale_alpha_continuous(range = c(0.3, 1)) +
    scale_y_log10() +
    theme_fivethirtyeight() + 
    scale_fill_fivethirtyeight() + 
    theme(
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      legend.position = "none",
      panel.grid.major = element_line(color = "grey90", linewidth = 0.5),
      panel.grid.minor = element_line(color = "grey95", linewidth = 0.25),
      plot.title = element_text(size = 13),
      plot.subtitle = element_text(size = 10)
    ) +
    geom_text(
      data = top_labels,
      aes(label = Artist),
      vjust = 0.5, 
      hjust = 0.5,
      size = 2.5,
      color = "#1b2322"
    ) +
    geom_text(
      data = mid_labels,
      aes(label = Artist),
      vjust = 0.5, 
      hjust = 0.5,
      size = 2,
      color = "#1b2322"
    ) +
    geom_text(
      data = bot_labels,
      aes(label = Artist),
      vjust = 0.5, 
      hjust = 0.5,
      size = 1,
      color = "#1b2322"
    ) 
  )
  

  
  assign(name, plot, envir = .GlobalEnv)
  assign(paste(name, "_interactive", sep = ""), plot_interactive, envir = .GlobalEnv)
}
