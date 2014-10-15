#
# Exploratory Data Analysis
# Course Project 1 Extension
# Plot 1
#

# needs data.table package for fast reading
require("data.table")

full_data <- fread('household_power_consumption.txt', na.strings="?")
dim(full_data)
colnames(full_data)

target_dates <- as.Date(c("2007-02-01", "2007-02-02"))
target_data <- full_data[
    as.Date(full_data$Date, format='%d/%m/%Y') %in% target_dates]

# build plot 1 - histogram
sTitle = 'Global Active Power'
sDimen = '(kilowatts)'
hist(as.numeric(target_data$Global_active_power), 
     col = 'red', xlab=paste(sTitle, sDimen), main=sTitle)

# copy to png device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()