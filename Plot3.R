
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#a plot answer this question.

library(ggplot2)

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt <- NEI[NEI$fips == "24510",]

png(filename ="Plot3.png")
grouped <- balt %>% group_by(type, year) %>% summarize(total = sum(Emissions))
grouped
qplot(x =  year, y = total, data = grouped) + facet_wrap(~type) + geom_bar(stat = "identity")

dev.off()