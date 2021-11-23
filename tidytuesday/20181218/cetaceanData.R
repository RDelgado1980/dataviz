# Tidytuesday 18-12-2018 Cetacean data

library(tidyverse)
library(scales)

dataset <- read_csv('https://github.com/rfordatascience/tidytuesday/blob/master/data/2018/2018-12-18/allCetaceanData.csv')

data <- dataset %>% filter(acquisition %in% c('Born', 'Rescue', 'Capture'))
data$acquisition <- factor(data$acquisition, levels = c('Rescue', 'Born', 'Capture'))
data <- data %>% mutate(acquisition = recode_factor(acquisition, 'Rescue' = 'RESCUED',
                                                    'Born' = 'BORN IN CAPTIVITY',
                                                    'Capture' = 'CAPTURED'))

data %>% ggplot(aes(x = originDate, fill = as.factor(acquisition))) + 
  geom_histogram(bins = 80, color = "#1c2a35", alpha = 0.7) +
  scale_fill_manual(values = c("CAPTURED" = "#f8f17c", 
                               "BORN IN CAPTIVITY" = "#708f6d", 
                               "RESCUED" = "#486d8a")) + 
  scale_x_date(date_breaks = '10 years', date_labels = "%Y") + 
  scale_y_discrete(limits = seq(0, 170, 20)) + 
  labs(x = '',
       y = 'NUMBER OF ACQUIRED CETACEANS',
       fill = '') +
  theme(
    plot.background = element_rect(fill = "#1c2a35" , color = "#1c2a35"),
    panel.background = element_rect(fill = "#1c2a35" , color = "#1c2a35"),
    legend.background = element_rect(fill = "#1c2a35" , color = "#1c2a35"),
    legend.key = element_rect(fill = "#1c2a35" , color = "#1c2a35"),
    legend.key.size = unit(10, "points"),
    axis.title.y = element_text(color = "#abc1d3"),
    axis.text.x = element_text(color = "#abc1d3"),
    axis.text.y = element_text(color = "#abc1d3"),
    legend.text = element_text(color = "#abc1d3"),
    legend.position = "top",
    legend.justification = "right",
    text=element_text(family = "Arial", face = "bold"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_line(size = 0.5, 
                                      linetype = 'dashed',
                                      colour = "#3f4d58"),
    panel.border=element_rect(colour = "#1c2a35", fill = NA),
    plot.margin=unit(c(0.5,2.5,0.5,2.5),"cm")
  )


