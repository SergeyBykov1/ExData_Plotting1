#
# Exploratory Data Analysis
# Course Project 1 Extension
# Plot 2
#

# needs data.table package for fast reading
require("data.table")

full_data <- fread('household_power_consumption.txt', na.strings="?")

target_dates <- as.Date(c("2007-02-01", "2007-02-02"))
target_data <- full_data[as.Date(full_data$Date, format='%d/%m/%Y') %in% target_dates]

# build plot 2
datetime <- as.POSIXct(
    paste(target_data$Date, target_data$Time), format = "%d/%m/%Y %T")

plot(datetime, target_data$Global_active_power, type='l',
     xlab = '', ylab = 'Global Active Power (kilowatts)')

# copy to png device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()