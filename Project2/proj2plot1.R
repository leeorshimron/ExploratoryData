#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#find total emissions for each year

totals <- aggregate(NEI$Emissions~NEI$year, FUN = sum)
colnames(totals) <- c("Year","Totals")

barplot(totals$Totals,names.arg=totals$Year, xlab="Year",ylab="Total Emissions",main="Total Emissions Per Year")
dev.off()