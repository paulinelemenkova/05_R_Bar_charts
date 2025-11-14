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
    "Cheese",
    "Food preparations",
    "Meat of turkey",
    "Hen eggs",
    "Beer of barley",
    "Skim milk"), ]
print(df)

nb.cols <- 22
#mycolors <- colorRampPalette(brewer.pal(8, "Set2"))(nb.cols)
mycolors <- colorRampPalette(brewer.pal(8, "hsv"))(nb.cols)

p<- ggplot(df, aes(x = Item, y = Value, fill = Item)) +
#p<- ggplot(df, aes(x = reorder(Item, Value), y = Value, fill = Item)) +
#    geom_col(width = 0.8, aes(fill = Item)) +
    geom_bar(stat="identity", width=0.9) +
    geom_text(aes(label = Value), vjust = 2, colour = "white", size = 2.5) +
scale_y_continuous(breaks = seq(0, 20000, by = 1000)) +
#scale_fill_brewer(palette = "Set2") +
scale_fill_manual(values = mycolors) +
theme(
    legend.position = "right",
    legend.text = element_text(size = 9),
    legend.title = element_text(size = 13),
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.ticks.length = unit(.1,"cm"),
    axis.text.x = element_text(face = 3, color = "black",
        size = 10, angle = 15),
    axis.text.y = element_text(face = 3, color = "black",
        size = 10, angle = 0)
    ) +
    guides(fill = guide_legend(
                ncol = 1,
                title = "Products")) +
    labs(
        title = "Trade matrix in Martinique for import quantity (t): major products  imported from France",
        subtitle = "Data: FAO",
        y = "Tons",
        x = "Products"
        )
p
ggsave("Fig_import_Mtq_FR.jpg", plot = p, dpi = 300,
    width = 10, height = 8, units = "in")

# ----------- parula ------------->

# install.packages("pals")
library(pals)
require(reshape2)

# Get a color palette from pals
my_colors <- as.vector(ocean.phase(25)) # Using a pals palette

p<- ggplot(df, aes(x = Item, y = Value, fill = Item)) +
#p<- ggplot(df, aes(x = reorder(Item, Value), y = Value, fill = Item)) +
#    geom_col(width = 0.8, aes(fill = Item)) +
    geom_bar(stat="identity", width=0.9) +
    geom_text(aes(label = Value), vjust = 2, colour = "white", size = 2.5) +
scale_y_continuous(breaks = seq(0, 20000, by = 1000)) +
scale_fill_manual(values = as.vector(gnuplot(22))) +
#scale_fill_manual(values = as.vector(isol(22))) +
#scale_fill_manual(values = as.vector(linearlhot(22))) +
#scale_fill_manual(values = as.vector(kelly(22))) +
#scale_fill_manual(values = as.vector(polychrome(22))) +
#scale_fill_manual(values = as.vector(glasbey(22))) +
#scale_fill_manual(values = as.vector(trubetskoy(22))) +
#scale_fill_manual(values = as.vector(alphabet(22))) +
#scale_fill_manual(values = as.vector(parula(22))) +
#scale_fill_manual(values = as.vector(jet(22))) +
#scale_fill_manual(values = as.vector(kovesi.rainbow(22))) +
#scale_fill_manual(values=as.vector(polychrome(22))) +
theme(
    legend.position = "right",
    legend.text = element_text(size = 9),
    legend.title = element_text(size = 13),
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 12),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    axis.ticks.length = unit(.1,"cm"),
    axis.text.x = element_text(face = 3, color = "black",
        size = 9, angle = 15),
    axis.text.y = element_text(face = 3, color = "black",
        size = 10, angle = 0)
    ) +
    guides(fill = guide_legend(
                ncol = 1,
                title = "Products")) +
    labs(
        title = "Trade matrix in Martinique for import quantity (t): major products  imported from France",
        subtitle = "Data: FAO",
        y = "Tons",
        x = "Products"
        )
p

ggsave("Fig_import_Mtq_FR.jpg", plot = p, dpi = 300,
    width = 10, height = 8, units = "in")
