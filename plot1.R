# This script creates a histogram of Global Active Power Consumption for the first 2 days in February 2007

# Read the data file into a table
mydata <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Convert Date Column from factor to Date Class
mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")

# Extract data from first 2 days in February 2007
subset <- mydata[(mydata$Date == "2007-02-01" | mydata$Date == "2007-02-02"),]

# Open png device file using default values of 480 for width and height
png(filename="plot1.png")

# Create historgram
hist(subset[,"Global_active_power"], col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close device file
dev.off()