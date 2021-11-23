# Grafico del mapa logistico

library(tidyverse)
library(viridis)
library(latex2exp)

dataset <- read_csv('dataLogisticMap.csv')

dataset %>% ggplot(aes(x=r, y=xn, colour = xn)) +
  geom_point(size = 0.1) +
  geom_vline(xintercept = 3.57, color = 'red') +
  geom_text(x = 3.57, y = 0.05, label = "Región Caótica", color = "red", hjust = -0.2, size = 4) +
  scale_color_viridis() +
  xlim(0, 4) +
  ggtitle(TeX('Diagrama de Bifurcación del Mapa Logístico $x_{n+1} = rx_{n}(1-x_{n})$')) +
  labs(subtitle = 'Borde del Caos r ~ 3.57',
       caption = 'Ronald Delgado | linkedin.com/in/ronald-delgado') + xlab(TeX('$r$')) + ylab(TeX('$x_{n+1}$')) + 
  theme(
    plot.background = element_rect(fill = "#000000"),
    panel.background = element_rect(fill = "#000000"),
    title = element_text(color = "#abc1d3", face = "bold", size = 22),
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
    plot.margin=unit(c(1.0,1.0,1.0,1.0),"cm"),
    plot.caption = element_text(size = 11),
    plot.subtitle = element_text(size = 16))
