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

#plot6
bal.e = summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), emissions=sum(Emissions))
los.e = summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), emissions=sum(Emissions))
bal.e$c <- "Baltimore"
los.e$c <- "Los Angeles"
merge.e = rbind(bal.e, los.e)

ggplot(merge.e, aes(x=factor(year), y=emissions, fill=c)) + geom_bar(stat="identity") + facet_grid(c~.) + ggtitle("Emissions from motor vehicle sources changed in Baltimore and Los Angeles")
dev.copy(png, file="plot6.png", width=480, height=480) 
dev.off()