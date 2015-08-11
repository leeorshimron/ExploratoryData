# first save text file into working directory

# load the data into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to get the rows that we want

power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#convert Global_active_power column from “factor” to “numeric” class

power2$Global_active_power <- as.numeric(levels(power2$Global_active_power))[power2$Global_active_power]

# Convert Sub_metering_1 from “factor” variable to “numeric” variable

power2$Sub_metering_1 <- as.numeric(levels(power2$Sub_metering_1))[power2$Sub_metering_1]

power2$Sub_metering_2 <- as.numeric(levels(power2$Sub_metering_2))[power2$Sub_metering_2]

power2$Sub_metering_3 <- as.numeric(levels(power2$Sub_metering_3))[power2$Sub_metering_3]

# Construct plot 3
plot(power2$Time, power2$Sub_metering_1, type="l",xlab="Time",ylab="Energy sub metering")
lines(power2$Time, power2$Sub_metering_2, col="red")
lines(power2$Time, power2$Sub_metering_3, col="blue")

legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering_2","Sub_metering_3"), cex=0.75)

dev.off()