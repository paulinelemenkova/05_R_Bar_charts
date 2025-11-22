library(RColorBrewer)
library(readr)
library(ggplot2)
library(pals)
library(viridis)

setwd("/Users/polinalemenkova/Documents/R/02_Boxplot")

df <- read_csv("IEB_export_Cuba.csv")
#head(df)
# Using read.csv() and explicitly confirming the separator
df <- read.csv("IEB_export_Cuba.csv", sep = ",")
head(df)
# Boxplots Grouping by 'category' using fill  for box plots and bar plots
#p <- ggplot(df, aes(Year, Mag, group = Year, )) +

p <- ggplot(df, aes(x = Mag, fill = Mag)) +
#    geom_col(stat="identity", alpha=1.0, width=.4) +
    geom_bar() +
    labs(title = "Frequensy of earthquakes with diverse magnitude in Cuba, 1976-2025. Data source: USGS",
#        x = "Magnitude (Richter scale (ML))",
        x = bquote("Richter scale, M" [L]),
        y = "Frequency of events during period 1976-2025") +
    theme(
        legend.position = "bottom",
        legend.text = element_text(size = 12),
        axis.text.x = element_text(size = 12, angle = 15, hjust = 1),
        axis.text.y = element_text(size = 12, angle = 0, hjust = 1)) +
    guides(fill = guide_legend(nrow = 2, byrow = T, reverse = F)) +
#    scale_fill_manual(values = as.vector(parula(31)))
#    scale_fill_manual(values = as.vector(gnuplot(31)))
#    scale_fill_manual(values = as.vector(turbo(31)))
#    scale_fill_manual(values = as.vector(kovesi.linear_bmy_10_95_c71(31)))
#    scale_fill_manual(values = as.vector(magma(31)))
#
#    scale_fill_manual(values = as.vector(kovesi.diverging_rainbow_bgymr_45_85_c67(31)))
#    scale_fill_manual(values = as.vector(plasma(31)))
    scale_fill_manual(values = as.vector(jet(31)))
#    scale_fill_manual(values = as.vector(tol.rainbow(31)))
#    scale_fill_manual(values = as.vector(polychrome(31)))
#    scale_fill_distiller(palette = "YlGn")
#    scale_fill_viridis_c(option = "inferno")
p
ggsave("Fig_export_Cuba_mag.jpg", plot = p, dpi = 300,
    width = 30, height = 25, units = "cm")

#  theme_linedraw()
#  theme_light()
#  theme_classic()
#  theme_minimal()
