# The source data can be downloaded here https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Unzip the above file and put in in the same folder with R code

# Just in case set the locale to English
Sys.setlocale("LC_TIME", "English")

# Set working directory
setwd("E:/DataScienceCoursera")

# Read the file into the dataset
encon<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?", sep=";")

#Convert the Date column into the Date format
encon$Date <- as.Date(encon$Date, format="%d/%m/%Y")

# Subset by specific dates
data <- subset(encon, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the initial dataset
rm(encon)

# Create Date_Time variable
data$Date_Time <- paste(data$Date, data$Time)

# Convert Date_Time variable to proper format
data$Date_Time <- strptime(data$Date_Time, format="%Y-%m-%d %H:%M:%S")

# Create a png device
png(filename = "plot4.png", width = 480, height = 480)

# Adjust margins and plot layout
par(mfrow = c(2, 2), mar = c(14, 6, 2, 2), cex=.5)

# Plot 1 - top left
plot(data$Date_Time, data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")

lines(data$Date_Time, data$Global_active_power, type="S")

#Plot 2 - top right
plot(data$Date_Time, data$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")

lines(data$Date_Time, data$Voltage, type="S")

# Plot 3 - bottom left
plot(data$Date_Time, data$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")

# Draw a line for Sub_metering_1
lines(data$Date_Time, data$Sub_metering_1, col = "black", type = "S")

# Draw a line for Sub_metering_2
lines(data$Date_Time, data$Sub_metering_2, col = "red", type = "S")

# Draw a line for Sub_metering_3
lines(data$Date_Time, data$Sub_metering_3, col = "blue", type = "S")

# Adds a legend by line color
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 - bottom right
plot(data$Date_Time, data$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global_reactive_power", type="n")

lines(data$Date_Time, data$Global_reactive_power, type="S")

# Close the device
dev.off()