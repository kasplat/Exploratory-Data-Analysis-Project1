#Plot1.R
#Author: Kesavan Kushalnagar

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total99 <- as.integer(sum(NEI[NEI$year == 1999,]$Emissions))
total02 <- as.integer(sum(NEI[NEI$year == 2002,]$Emissions))
total05 <- as.integer(sum(NEI[NEI$year == 2005,]$Emissions))
total08 <- as.integer(sum(NEI[NEI$year == 2008,]$Emissions))
png(filename = "plot1.png")
barplot(c(total99,total02,total05,total08)/1000000, names.arg = c("1999", "2002", "2005", "2008"), 
        main = "Total Emissions per Year", xlab = "Year", ylab = "Emissions (in 100,000 tons)")
dev.off()
#Clearly the answer is a resounding yes (hooray!)
