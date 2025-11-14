library(ggplot2)
library(ggpubr)
library(readr)
library(tidyverse)
library(dplyr)

df <- read_csv("FAOSTAT_data_import_quantity.csv")
#print(df)
#head(df)

df <- df[, c("Item", "Value")]
head(df)
#print(df)

#df <- df[df$"Element" %in% "Export quantity", ]
#head(df)

df <- df[df$Item %in% c(
    "Raw milk of cattle",
    "Maize",
    "Refined sugar",
    "Meat of chickens",
    "Wheat flour",
    "Wine",
    "Sunflower-seed oil",
    "Potatoes",
    "Pastry",
    "Dog or cat food",
    "Meat of cattle",
    "Pig meat",
    "Sausages",
    "Vegetables preserved",
    "Whole milk powder",
    "Chocolate",
    "Food preparations",
    "Skim milk"), ]
print(df)

p<- ggplot(df, aes(x = Item, y = Value, fill = Item)) +
#p<- ggplot(df, aes(x = reorder(Value, Item), y = Value, fill = Item)) +
#p<- ggplot(df, aes(x = reorder(Item, Value), y = Value, fill = Item)) +
#    geom_col(width = 0.8, aes(fill = Item)) +
    geom_bar(stat="identity", width=0.8) +
    geom_text(aes(label = Value), vjust = 2, colour = "white") +
#scale_y_continuous(breaks = seq(800, 5000, by = 50)) +
#scale_y_discrete(labels=c("0.5" = "Dose 0.5", "1" = "Dose 1", "2" = "Dose 2")) +
theme(
    legend.position = "right",
#    legend.justification = c(0, 0),
    legend.text = element_text(size = 10),
    legend.title = element_text(size = 13),
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.text.x = element_text(face = 3, color = "black",
        size = 10, angle = 15),
    axis.text.y = element_text(face = 3, color = "black",
        size = 10, angle = 0)
    ) +
labs(
    title = "Trade matrix in Martinique for import quantity (t): major products  imported from France",
    subtitle = "Data: FAO",
    y = "tons",
    x = "Item",
#    color = "Item"
)
p
