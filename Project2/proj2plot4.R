#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# subset SCC to include only Coal
coal <- SCC[grep("Coal",SCC$EI.Sector),]

#Subset NEI with coal SCC codes
coalNEI <- NEI[coal$SCC %in% NEI$SCC,]

coaltotals <- aggregate(coalNEI$Emissions~coalNEI$year, FUN=sum)
colnames(coaltotals) <- c("Year","Totals")

barplot(coaltotals$Totals,names.arg=coaltotals$Year, xlab="Year", ylab="Total Emissions",main="Total Emissions of Coal Per Year")
dev.off()