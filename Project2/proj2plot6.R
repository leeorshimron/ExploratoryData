#Read in files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset for Baltimore City
BaltCity <- NEI[NEI$fips=="24510",]

# Subset for LA
LAC <- NEI[NEI$fips=="06037",]

#Search SCC for only motor vehicles
gasindex <- grep("Vehicles | Trucks | Veh",SCC$Short.Name)

gasubset <- SCC[gasindex,]

#Subset NEI to match with corresponding SCC codes in Baltimore City
MVBC <- BaltCity[gasubset$SCC %in% BaltCity$SCC,]

#Subset NEI to match with corresponding SCC codes in LA
MVLA <- LAC[gasubset$SCC %in% LAC$SCC,]

#Aggregate emissions per year for Baltimore City
MVBCtotals <- aggregate(MVBC$Emissions~MVBC$year, FUN=sum)
colnames(MVBCtotals) <- c("Year","Totals")

#Aggregate emissions per year for LA
MVLAtotals <- aggregate(MVLA$Emissions~MVLA$year, FUN=sum)
colnames(MVLAtotals) <- c("Year","Totals")

#Combine both datasets
MVBCtotals <- cbind(MVBCtotals,City = "BC")
MVLAtotals <- cbind(MVLAtotals,City="LAC")
mydata <- rbind(MVBCtotals,MVLAtotals)

g <- ggplot(mydata)
p <- g + geom_bar(aes(x=Year,y=Totals,group=City,colour=City),stat="identity",position="dodge") + ggtitle("Motor Vehicle Emissions for BC & LAC")
print(p)
dev.off()

