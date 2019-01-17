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

#plot5

bal.e.m.byyear = summarise(group_by(filter(NEI, fips == "24510" & type=="ON-ROAD"), year), emissions=sum(Emissions))
ggplot(bal.e.m.byyear, aes(x=factor(year), y=emissions,fill=year)) + geom_bar(stat="identity") + ggtitle("Emissions from motor vehicle sources changed in Baltimore City")
dev.copy(png, file="plot5.png", width=480, height=480) 
dev.off()