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

#plot2
bal.e = summarise(group_by(filter(NEI, fips == "24510"), year), emissions=sum(Emissions))
plot(bal.e$year, bal.e$emissions, type='l', ylab='Emissions', xlab='Year', main = "Total Tons of PM2.5 Emissions in Baltimore")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()