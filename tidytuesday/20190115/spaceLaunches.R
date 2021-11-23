# Tidytuesday 15/01/2019 - Space Launches
library(tidyverse)

dataset <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-01-15/launches.csv")

dataset %>% filter(state_code == "CN") %>% ggplot(aes(x = launch_date)) + 
  geom_area(stat = "bin", fill = 'red', bins = 40) + 
  theme_minimal() + 
  labs(x = "Launch Date",
       y = "Number of Launches",
       title = "Time frame of Venezuelan Satellites launched by China") + 
  scale_x_date(breaks = "5 years", date_labels = "%Y", limits = c(as.Date('1970-04-24'), as.Date(Sys.Date()))) +
  geom_vline(xintercept = as.Date('2008-10-29'), color = "#abc1d3", size = 0.8) + 
  geom_text(x = as.Date('2008-10-29'), y = 31, label = "VENESAT-1", angle = 90, vjust = -0.6, color = "#abc1d3", size = 5) + 
  geom_vline(xintercept = as.Date('2012-09-29'), color = "#abc1d3", size = 0.8) + 
  geom_text(x = as.Date('2012-09-29'), y = 31, label = "VRSS-1", angle = 90, vjust = -0.5, color = "#abc1d3", size = 5) +
  geom_vline(xintercept = as.Date('2017-10-09'), color = "#abc1d3", size = 0.8) + 
  geom_text(x = as.Date('2017-10-09'), y = 31, label = "VRSS-2", angle = 90, vjust = 1.5, color = "#abc1d3", size = 5) + 
  theme(
    plot.background = element_rect(fill = "#17222b"),
    panel.background = element_rect(fill = "#17222b"),
    title = element_text(color = "#abc1d3", face = "bold", size = 16),
    axis.title.y = element_text(color = "#abc1d3", face = "bold", size = 14),
    axis.title.x = element_text(color = "#abc1d3", face = "bold", size = 14),
    axis.text.x = element_text(color = "#abc1d3"),
    axis.text.y = element_text(color = "#abc1d3"),
    text=element_text(family = "Arial", face = "bold"),
    panel.grid.major.x = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.minor.y = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.border=element_rect(colour = "#3f4d58", fill = NA),
    plot.margin=unit(c(0.5,1.5,0.5,1.5),"cm")
  )