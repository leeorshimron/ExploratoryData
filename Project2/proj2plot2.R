#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimore City
BaltCity <- NEI[NEI$fips==24510,]

BCtotals <- aggregate(BaltCity$Emissions~BaltCity$year, FUN=sum)
colnames(BCtotals) <- c("Year","Totals")

barplot(BCtotals$Totals,names.arg=BCtotals$Year, xlab="Year", ylab="Total Emissions",main="Total Emissions Per Year")
dev.off()