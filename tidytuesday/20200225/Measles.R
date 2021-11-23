# TidyTuesday 25/02/2020 Measles
library(tidyverse)
library(viridis)

dataset <- read_csv('https://github.com/WSJ/measles-data/raw/master/all-measles-rates.csv')

dataset <- dataset %>% filter(!is.na(type))

filtered <- dataset %>% group_by(type) %>% summarise(meanMMR = mean(mmr)) %>% 
  mutate(type = fct_reorder(type, meanMMR)) %>% ungroup()

filtered %>% ggplot(aes(x=type, y=meanMMR, fill=type)) + 
  geom_col() +
  scale_fill_viridis(discrete = TRUE) +
 theme_light() +
  labs(x='',
       y='',
       title='Mean Measles, Mumps and Rubella Vaccination Rate',
       subtitle='by Type of School',
       caption = 'Plot: Ronald Delgado | Data: TidyTuesday 25/02/2020') +
  theme(
    plot.background = element_rect(fill = "#000000", colour = "#000000"),
    panel.background = element_rect(fill = "#000000"),
    title = element_text(color = "#abc1d3", face = "bold", size = 16),
    axis.title.y = element_text(color = "#ffffff", face = "bold", size = 20, family = "mono"),
    axis.title.x = element_text(color = "#ffffff", face = "bold", size = 20, family = "mono"),
    axis.text.x = element_text(color = "#ffffff", size = 12, family = "mono"),
    axis.text.y = element_text(color = "#ffffff", size = 12, family = "mono"),
    text=element_text(family = "Arial"),
    panel.grid.major.x = element_line(size = 0.3, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.minor.x = element_line(size = 0.3, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.major.y = element_line(size = 0.3, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.grid.minor.y = element_line(size = 0.3, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.border=element_rect(colour = "#000000", fill = NA),
    legend.position = "none",
    plot.margin=unit(c(1.0,1.0,1.0,1.0),"cm"))

ggsave('MeaslesPlot.png', dpi=300, width = 12, height = 9)
