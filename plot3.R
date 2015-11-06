# This script creates a plot of 3 Energy Sub-metering Readings for the first 2 days in February 2007

# Read the data file into a table
mydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Convert Date Column from factor to Date Class
mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")

# Extract data from first 2 days in February 2007
subset <- mydata[(mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02"),]

# Extract Time Column and convert from factor to Time Class
mytime <- strptime(paste(subset[,1], subset[,2]),"%Y-%m-%d %H:%M:%S")

# Open png device file using default values of 480 for width and height
png(filename="plot3.png")

# Create plot
plot(mytime,subset$Sub_metering_1, type="n",xlab = "", ylab = "Energy sub metering")
lines(mytime,subset$Sub_metering_1)
lines(mytime,subset$Sub_metering_2, col = "red")
lines(mytime,subset$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))

# Close device file
dev.off()