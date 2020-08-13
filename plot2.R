library(lubridate)

dataFile <- './data/household_power_consumption.txt'
headers <- names(read.table(dataFile, sep = ';', nrows = 1, header = T))
## I've used grep("1/2/2007", readLines(dataFile)) to find how many rows to skip
rawData <- read.table(dataFile, sep = ';', skip = 66637, nrows = 2880, col.names = headers)

rawData$DateTime <- dmy(rawData$Date) + hms(rawData$Time)

plot(rawData$DateTime, rawData$Global_active_power, type="l", xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, 'plot2.png', width = 480, height = 480, units = 'px')
dev.off()
