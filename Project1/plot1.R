# first save text file into working directory

# load the data into R
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#subset data to get the rows that we want

power2 <- subset(power, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

#convert Global_active_power column from “factor” to “numeric” class

power2$Global_active_power <- as.numeric(levels(power2$Global_active_power))[power2$Global_active_power]

# Create histogram (plot1)

hist(power2$Global_active_power, breaks=12, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

#save plot1 as png file

png("plot1.png", width=480, height=480)

dev.off()
