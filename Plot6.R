#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
balt <- NEI[NEI$fips == "24510",]

motor <- balt[balt$SCC %in% SCC[grep("Motor",SCC$Short.Name),]$SCC, ]
head(motor)
grouped_motor <- motor %>% group_by(year) %>% summarize(total = sum(Emissions))
grouped_motor
baltplot <- qplot(x = year, y = total, data = grouped_motor)+  geom_bar(stat = "identity") + ggtitle(label = "Baltimore motor vehicle emissions")
baltplot

la <- NEI[NEI$fips == "06037",]
motorla <- la[la$SCC %in% SCC[grep("Motor",SCC$Short.Name),]$SCC, ]
grouped_motorla <- motorla %>% group_by(year) %>% summarize(total = sum(Emissions))
laplot <- qplot(x = year, y = total, data = grouped_motorla)+  geom_bar(stat = "identity")  + ggtitle(label = "LA motor vehicle emissions")

library(gridExtra)
png(filename = "Plot6.png")
grid.arrange(baltplot, laplot, ncol = 2)
dev.off()

#LA has seen more increase