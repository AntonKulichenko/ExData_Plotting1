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
png(filename = "plot2.png", width = 480, height = 480)

# Adjust margin parameters
par(mar = c(6, 6, 5, 4))

# Create empty plot with proper axis labels
plot(data$Date_Time, data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")

# Draw the lines based on variables
lines(data$Date_Time, data$Global_active_power, type="S")

# Close the device
dev.off()