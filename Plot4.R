#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename= "Plot4.png")
coal <- NEI[NEI$SCC == "30510205",]
coal <- NEI %>% group_by(year) %>% summarize(total = sum(Emissions))
qplot(year, total, data = coal) + geom_bar(stat = "identity") + ggtitle(label= "Coal Emissions from 1999 to 2008")
dev.off()
