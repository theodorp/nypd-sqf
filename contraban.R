contra <- read.csv('contraban.csv')
contra$months <- as.POSIXct(contra$months, tz='EST', "%Y-%m-%d")

contra$contraban <-  ifelse(contra$contrabn == 1, 'Contraban Found', 'Not Found')

#contra$prop <- contra$prop*100

p <- ggplot(contra, aes(x=months, y=race_prop, color=contraban)) + 
        geom_point() + facet_grid(race ~ .) #+ geom_smooth(method='loess')

gg <- p + theme_bw(base_size = 16, base_family = "Helvetica Neue Light") +
        ggtitle(expression(atop("NYPD Stop and Frisk Contraban data", atop(italic("By theodor"), "theodor.io")))) +
        xlab(" ") + ylab("Percentage of stops per month") +
        theme(panel.margin.y=unit(1,"lines"))