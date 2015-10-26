library(ggplot2)
danwin <- read.csv('danwin.csv')

danwin$months <- as.POSIXct(danwin$months, tz='EST', "%Y-%m-%d")

danwin$race <- ifelse(danwin$race == 'A', 'Asian', ifelse(danwin$race == 'B', 'Black', ifelse(danwin$race == 'W', 'White', 'Hispanic')))

gg <- ggplot(danwin, aes(x = months, y = stops, fill = race)) +
        geom_bar(stat='identity', colour='gray') + 
        geom_smooth(method = "loess", span = 0.25) + facet_grid(race ~ .) +
        scale_y_continuous(limits=c(0,40000)) + 
        theme_minimal(base_size = 12, base_family = "Helvetica Neue Medium") +
        ylab('Number of Stops Per Month') + xlab(' ') + 
        theme(legend.position = "none", plot.title = element_text(size=20)) +
        theme(strip.background = element_rect(fill = 'white', size = 0)) +
        ggtitle(expression(atop("NYPD Stop and Frisk data", atop(italic("By Theodor"), "theodor.io"))))

print(gg)