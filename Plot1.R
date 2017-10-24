#Plot1.R
#Author: Kesavan Kushalnagar

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
table(NEI$year)
NEI99 <- NEI[NEI$year == 1999,]
NEI02 <- NEI[NEI$year == 2002,]
NEI05 <- NEI[NEI$year == 2005,]
NEI08 <- NEI[NEI$year == 2008,]
boxplot(NEI99$Emissions)
