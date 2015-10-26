require(grid)
require(ggplot2)

danwin <- read.csv('danwin.csv')

danwin$months <- as.POSIXct(danwin$months, tz='EST', "%Y-%m-%d")

danwin$race <- ifelse(danwin$race == 'A', 'Asian', ifelse(danwin$race == 'B', 'Black', ifelse(danwin$race == 'W', 'White', 'Hispanic')))

gg <- ggplot(danwin, aes(x = months, y = prop, color = race)) +
        geom_point() + geom_smooth(method = "loess", span = 0.25) +
        scale_y_continuous(limits=c(0,0.75), breaks=seq(0, 0.7, by=0.1)) + 
        theme_minimal(base_size = 12, base_family = "Helvetica Neue Medium") +
        ylab('Proportion of Stops Per Month') + xlab(' ') + 
        theme(plot.title = element_text(size=20)) +
        # scale_colour_brewer(palette="Pastel1") + 
        ggtitle(expression(atop("NYPD Stop and Frisk data", atop(italic("By Theodor"), "theodor.io"))))

print(gg)