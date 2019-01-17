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

#plot4
c.coal = grepl("Fuel Comb.*Coal", SCC$EI.Sector)
c.coal.sources = SCC[c.coal,]

e.coal.combustion = NEI[(NEI$SCC %in% c.coal.sources$SCC), ]
e.coal.related = summarise(group_by(e.coal.combustion, year), emissions=sum(Emissions))
ggplot(e.coal.related, aes(x=factor(year), y=emissions, fill=year)) + geom_bar(stat="identity") + ggtitle("Emissions from coal combustion-related sources")
dev.copy(png, file="plot4.png", width=480, height=480) 
dev.off()