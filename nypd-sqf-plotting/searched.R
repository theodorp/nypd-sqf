searched <- read.csv('searched.csv')
searched$months <- as.POSIXct(searched$months, tz='EST', "%Y-%m-%d")

searched$searched <-  ifelse(searched$searched == 1, 'Stopped & Searched', 'Stopped & Not Searched')

searched$race_prop <- searched$race_prop*100

p <- ggplot(searched, aes(x=months, y=race_prop, color=race)) + 
        geom_point() + facet_grid(searched ~ ., scales="free") + geom_smooth(method='loess')

gg <- p + theme_bw(base_size = 14, base_family = "Helvetica Neue Light") +
        ggtitle(expression(atop("NYPD Stop and Frisk Contraban data", atop(italic("By theodor"), "theodor.io")))) +
        xlab(" ") + ylab("Percentage of stops per month") +
        theme(panel.margin.y=unit(1,"lines"))

gg