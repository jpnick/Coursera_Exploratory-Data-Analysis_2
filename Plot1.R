library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

file1 = "./Week 4/summarySCC_PM25.rds"
file2 = "./Week 4/Source_Classification_Code.rds"

NEI = readRDS(file1)
head(NEI)
SCC = readRDS(file2)
head(SCC)

#plot1
total.e = summarise(group_by(NEI, year), emissions=sum(Emissions))
plot(total.e$year, total.e$emissions, type='l', ylab='Emissions', xlab='Year', main = "Total Tons of PM2.5 Emissions")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()