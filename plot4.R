#
# Exploratory Data Analysis
# Course Project 1 Extension
# Plot 4
#

# needs data.table package for fast reading
require("data.table")

full_data <- fread('household_power_consumption.txt', na.strings="?")

target_dates <- as.Date(c("2007-02-01", "2007-02-02"))
target_data <- full_data[as.Date(full_data$Date, format='%d/%m/%Y') %in% target_dates]

datetime <- as.POSIXct(
    paste(target_data$Date, target_data$Time), format = "%d/%m/%Y %T")

# construct png directly, as dev.copy results in cropped legend
png("plot4.png", width = 480, height = 480)

par(mfcol = c(2, 2)) # columnwise
# 1
plot(datetime, target_data$Global_active_power, type='l',
     xlab = '', ylab = 'Global Active Power')
# 2
plot(datetime, target_data$Sub_metering_1, type='l',
     xlab = '', ylab = 'Energy sub metering')
lines(datetime, target_data$Sub_metering_2, type='l', col='red')
lines(datetime, target_data$Sub_metering_3, type='l', col='blue')
legend("topright", col = c("black","blue", "red"), lwd=1, bty='n',
       legend = colnames(target_data)[7:9])
# 3
with(target_data, plot(datetime, Voltage, type='l'))
# 4
with(target_data, plot(datetime, Global_reactive_power, type='l'))

dev.off()