#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimore City
BaltCity <- NEI[NEI$fips==24510,]

typetotals <- aggregate(BaltCity$Emissions~BaltCity$year+BaltCity$type,FUN=sum)
colnames(typetotals) <- c("Year","Type","Totals")

g <- ggplot(typetotals)
p <- g + geom_line(aes(x=Year,y=Totals,group=Type,colour=Type)) + ggtitle("Emissions by Type")
print(p)
dev.off()
