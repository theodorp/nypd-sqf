df <- read.csv('plot_inR.csv')
df$X <- NULL
#df$monthly <- ymd(df$monthly)
df$monthly <- as.POSIXct(df$monthly, tz='EST', "%Y-%m-%d")
gg <- ggplot(df, aes(x=monthly, y=prop, fill=race)) + geom_point() +
        geom_smooth() + theme_minimal() +
        theme(legend.position = "none",text = element_text(family="Helvetica Neue Light"), plot.title = element_text(size=20)) +
        ggtitle(expression(atop("NYPD Stop and Frisk data"))) +
        ylab("Proportionate Stops per month") + xlab(" ") +
        scale_x_datetime(breaks = date_breaks("1 year"), labels = date_format("%Y"))
gg
