#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimore City
BaltCity <- NEI[NEI$fips==24510,]

#Search SCC for only motor vehicles
gasindex <- grep("Vehicles | Trucks | Veh",SCC$Short.Name)

gasubset <- SCC[gasindex,]

#Subset NEI to match with corresponding SCC codes
MVNEI <- BaltCity[gasubset$SCC %in% BaltCity$SCC,]

MVtotals <- aggregate(MVNEI$Emissions~MVNEI$year, FUN=sum)
colnames(MVtotals) <- c("Year","Totals")

barplot(MVtotals$Totals,names.arg=MVtotals$Year, xlab="Year", ylab="Total Emissions",main="Total Emissions of Motor Vehicles Per Year")
dev.off()