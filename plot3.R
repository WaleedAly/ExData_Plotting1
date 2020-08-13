library(lubridate)

dataFile <- './data/household_power_consumption.txt'
headers <- names(read.table(dataFile, sep = ';', nrows = 1, header = T))
## I've used grep("1/2/2007", readLines(dataFile)) to find how many rows to skip
rawData <- read.table(dataFile, sep = ';', skip = 66637, nrows = 2880, col.names = headers)

rawData$DateTime <- dmy(rawData$Date) + hms(rawData$Time)

plot(rawData$DateTime, rawData$Sub_metering_1, type='l', xlab = '', ylab = 'Energy sub metering')
lines(rawData$DateTime, rawData$Sub_metering_2, col = 'red')
lines(rawData$DateTime, rawData$Sub_metering_3, col = 'blue')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), cex = 0.8, lty = 1, col = c('black', 'red', 'blue'))
dev.copy(png, 'plot3.png', width = 480, height = 480, units = 'px')
dev.off()
