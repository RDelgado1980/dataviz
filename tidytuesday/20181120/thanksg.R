# TidyTuesday 20/11/2018

library(tidyverse)
dataset <- read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2018-11-20/thanksgiving_meals.csv')

dataset %>% select(main_dish) %>% summarise_all(funs(sum(is.na(.))))
dataset <- dataset %>% filter(!is.na(main_dish) & !is.na(gender))

dataset$main_dish <- as.factor(dataset$main_dish)

group.color = c('Female' = "#D90368",
                'Male' = "#006BA6")

dataset %>% group_by(main_dish, gender) %>% summarise(count = n()) %>%
  ungroup() %>% mutate(main_dish = fct_reorder(main_dish, count)) %>% 
  ggplot(aes(x=main_dish, y = count, fill = gender)) + geom_col() + coord_flip() + 
  labs(x = 'Main Thanksgiving Dish',
       y = 'Counts',
       fill = 'Gender',
       title = 'Favorite Thanksgiving Dishes by Gender',
       subtitle = 'Turkey is overall winner!') +
  theme_light() + 
  scale_fill_manual(values=group.color) +
  theme(plot.title = element_text(color="black", size=14, face="bold.italic"),
        axis.title.x = element_text(color="black", size=12, face="bold"),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        legend.text = element_text(color="black", size=12, face="bold"),
        )

dataset %>% group_by(main_dish, gender) %>% summarise(count = n()) %>%
  ungroup() %>% mutate(main_dish = fct_reorder(main_dish, count)) %>% 
  ggplot(aes(x=main_dish, y = count, fill = gender)) + geom_col(position = 'fill') + coord_flip() + 
  labs(x = 'Main Thanksgiving Dish',
       y = 'Counts',
       fill = 'Gender',
       title = 'Favorite Thanksgiving Dishes by Gender',
       subtitle = 'Normalized Proportions') +
  theme_light() + 
  scale_fill_manual(values=group.color) +
  theme(plot.title = element_text(color="black", size=14, face="bold.italic"),
        axis.title.x = element_text(color="black", size=12, face="bold"),
        axis.title.y = element_text(color="black", size=12, face="bold"),
        legend.text = element_text(color="black", size=12, face="bold"),
  )
