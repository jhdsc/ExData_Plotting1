# This script creates the following 4 plots for the first 2 days in February 2007:
# Global Active Power
# Voltage
# 3 Energy Sub-metering Readings 
# Global Reactive Power

# Read the data file into a table
mydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Convert Date Column from factor to Date Class
mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")

# Extract data from first 2 days in February 2007
subset <- mydata[(mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02"),]

# Extract Time Column and convert from factor to Time Class
mytime <- strptime(paste(subset[,1], subset[,2]),"%Y-%m-%d %H:%M:%S")

# Open png device file using default values of 480 for width and height
png(filename="plot4.png")

# Create plot
par(mfrow = c(2, 2))
plot(mytime,subset$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
plot(mytime,subset$Voltage, type="l",xlab = "datetime", ylab = "Voltage")
plot(mytime,subset$Sub_metering_1, type="n",xlab = "", ylab = "Energy sub metering")
lines(mytime,subset$Sub_metering_1)
lines(mytime,subset$Sub_metering_2, col = "red")
lines(mytime,subset$Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
plot(mytime,subset$Global_reactive_power, type="l",xlab = "datetime", ylab = "Global_reactive_power")

# Close device file
dev.off()