# Library
library(tidyverse)
library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(forcats)

df <- read.csv("table.csv", header=TRUE, sep = ",")
head(df)

# to extend a number of colors in RColorBrewer fixed palette
nb.cols <- length(unique(df$Item))
my_custom_colors <- colorRampPalette(brewer.pal(9, "Set1"))(nb.cols)

p<- ggplot(data = df, aes(x = Value, y = Item, fill = Item)) +
    scale_x_continuous(labels = function(x) format(x, scientific = F, digits = 1)) +
    geom_bar(stat="identity", alpha=1.0, width=.4) +
#    scale_fill_brewer(palette = "Set1") +
    scale_fill_manual(values = my_custom_colors) +
#    coord_flip() +
#    xlab("") +
    labs(title = "Economic output of agriculture sector in India: 2000-2023", x = "Gross Production Value (in current US $)", y = "Products") +
    theme_grey()
p
