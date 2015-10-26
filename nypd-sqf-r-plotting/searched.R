require(grid)
require(ggplot2)

searched <- read.csv('searched.csv')
searched$months <- as.POSIXct(searched$months, tz='EST', "%Y-%m-%d")

searched$searched <-  ifelse(searched$searched == 1, 'Searched', 'Not Searched')

searched$race <- ifelse(searched$race == 'A', 'Asian', ifelse(searched$race == 'B', 'Black', ifelse(searched$race == 'W', 'White', 'Hispanic')))

searched$searched <- factor(searched$searched, levels = c("Searched", "Not Searched"))

p <- ggplot(searched, aes(x=months, y=race_prop, color=searched)) + 
        geom_point() + facet_grid(race ~ .) +
        geom_smooth(method='loess', span=0.3) +
        scale_y_continuous(breaks=seq(0,1,by=0.2)) +
#         scale_colour_brewer(palette="Pastel1") + 
        theme_bw(base_size = 14, base_family = "Helvetica Neue") +
        theme(panel.border = element_rect(fill=NA, color="grey", size=0.5, linetype="solid")) +
        theme(panel.margin.y=unit(0.7,"lines")) + 
        ggtitle(expression(atop("NYPD Stop and Frisk - Search data", atop(italic("By theodor"), "theodor.io")))) +
        ylab("Proportion of Searches Per Month") + xlab(" ")

print(p)