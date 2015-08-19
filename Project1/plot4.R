# first save text file into working directory

# load the data into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to get the rows that we want

power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#convert Global_active_power column from “factor” to “numeric” class

power2$Global_active_power <- as.numeric(levels(power2$Global_active_power))[power2$Global_active_power]

# Create plot 4

par(mfrow = c(2,2))
plot(power2$Time,power2$Global_active_power,type="l",xlab="Time",ylab="Global Active Power (kilowatts)")
plot(power2$Time,power2$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(power2$Time, power2$Sub_metering_1, type="l",xlab="Time",ylab="Energy sub metering")
lines(power2$Time, power2$Sub_metering_2, col="red")
lines(power2$Time, power2$Sub_metering_3, col="blue") plot(power2$Time,power2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()