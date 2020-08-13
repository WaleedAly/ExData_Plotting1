library(lubridate)

dataFile <- './data/household_power_consumption.txt'
headers <- names(read.table(dataFile, sep = ';', nrows = 1, header = T))
## I've used grep("1/2/2007", readLines(dataFile)) to find how many rows to skip
rawData <- read.table(dataFile, sep = ';', skip = 66637, nrows = 2880, col.names = headers)

rawData$DateTime <- dmy(rawData$Date) + hms(rawData$Time)

par(mfrow = c(2, 2))

plot(rawData$DateTime, rawData$Global_active_power, type="l", xlab = '', ylab = 'Global Active Power')

plot(rawData$DateTime, rawData$Voltage, type="l", xlab = 'datetime', ylab = 'Voltage')

plot(rawData$DateTime, rawData$Sub_metering_1, type='l', xlab = '', ylab = 'Energy sub metering')
lines(rawData$DateTime, rawData$Sub_metering_2, col = 'red')
lines(rawData$DateTime, rawData$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty = 'n', lty = 1, col = c('black', 'red', 'blue'))

plot(rawData$DateTime, rawData$Global_reactive_power, type="l", xlab = 'datetime', ylab = 'Global_reactive_power')

dev.copy(png, 'plot4.png', width = 480, height = 480, units = 'px')
dev.off()

par(mfrow = c(1, 1))

