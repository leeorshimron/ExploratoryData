# first save text file into working directory

# load the data into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to get the rows that we want

power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#convert Global_active_power column from “factor” to “numeric” class

power2$Global_active_power <- as.numeric(levels(power2$Global_active_power))[power2$Global_active_power]

# merge the date and time fields

power2$Time <- strptime(paste(power2$Date,power2$Time),"%d/%m/%Y %H:%M:%S")

plot(power2$Time,power2$Global_active_power,type="l",xlab="Time",ylab="Global Active Power (kilowatts)")

dev.off()
