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
png(filename = "Plot5.png")
baltplot
dev.off()
