power <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors=F)
power$Datef <- as.Date(power$Date, format='%d/%m/%Y')
powersub <- subset(power, (Datef >= '2007-02-01' & Datef <= '2007-02-02'))

powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

png('plot1.png')

hist(powersub$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()