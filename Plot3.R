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

#plot3
bal.e.byyear = summarise(group_by(filter(NEI, fips == "24510"), year,type), emissions=sum(Emissions))
ggplot(bal.e.byyear, aes(x=factor(year), y=emissions, fill=type)) + geom_bar(stat="identity") + facet_grid(. ~ type) + ggtitle("Total Tons of PM2.5 Emissions in Baltimore by Source Type")
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()