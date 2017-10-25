#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "Plot2.png")
balt <- NEI[NEI$fips == "24510",]
total99 <- as.integer(sum(balt[balt$year == 1999,]$Emissions))
total02 <- as.integer(sum(balt[balt$year == 2002,]$Emissions))
total05 <- as.integer(sum(balt[balt$year == 2005,]$Emissions))
total08 <- as.integer(sum(balt[balt$year == 2008,]$Emissions))
barplot(c(total99,total02,total05,total08)/1000000, names.arg = c("1999", "2002", "2005", "2008"), 
        main = "Total Emissions per Year in Baltimore", xlab = "Year", ylab = "Emissions (in 100,000 tons)")
dev.off()
#Baltimore has decreased, but there was an increase in 2005 for some reason. Hmmm....
