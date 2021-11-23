# Tidytuesday 08/01/2018 - Golden Age of TV

library(tidyverse)

dataset <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-08/IMDb_Economist_tv_ratings.csv')

dataset$title <- as.factor(dataset$title)

dataset <- dataset %>% separate(genres, c('genre1', 'genre2', 'genre3'))

series <- dataset %>% group_by(title, genre1) %>% 
  summarise(seasons = n(), avgSnsRating = mean(av_rating)) %>% ungroup()

group.colors <- c( 
                  'Action' = "#29366f", 
                  'Adventure' = "#405bd0",
                  'Animation' = "#4fa4f7", 
                  'Biography' ="#86ecf8", 
                  'Comedy' = "#f4f4f4",
                  'Crime' ="#93b6c1", 
                  'Documentary' = "#557185",
                  'Drama' = "#324056")

series %>% group_by(genre1) %>% summarise(total = n(), max = max(avgSnsRating)) %>% 
  ggplot(aes(x = genre1, y = max, fill = genre1)) + 
  geom_col(show.legend = FALSE, alpha = 0.7) + coord_polar() + ylim(-4.5,10) +
  theme_minimal() + labs(x = '',
                         y = '',
                         title = "TV's Golden Age",
                         subtitle = "Max Rating for Series Seasons' Mean Ratings by Genre") +  
  scale_fill_manual(values=group.colors) +
  theme(
    plot.background = element_rect(fill = "#1a1c2c" , color = "#1a1c2c"),
    panel.background = element_rect(fill = "#1a1c2c" , color = "#1a1c2c"),
    plot.title = element_text(color = "#abc1d3"),
    plot.subtitle = element_text(color = "#abc1d3"),
    axis.title.y = element_text(color = "#abc1d3"),
    axis.text.x = element_text(color = "#abc1d3"),
    axis.text.y = element_text(color = "#abc1d3"),
    legend.text = element_text(color = "#abc1d3"),
    text=element_text(family = "Arial", face = "bold"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.minor.y = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.border=element_rect(colour = "#1a1c2c", fill = NA),
    plot.margin=unit(c(0.5,0.5,0.5,0.5),"cm")
  )







