power <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors=F)
power$Datef <- as.Date(power$Date, format='%d/%m/%Y')
powersub <- subset(power, (Datef >= '2007-02-01' & Datef <= '2007-02-02'))

powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

png('plot4.png')
par(mfcol=c(2,2))

# 1
plot(x=s, y=powersub$Global_active_power, ylab='Global Active Power', type='l', xlab='', xaxt='n')
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))

# 2
plot(x=s, y=powersub$Sub_metering_1, ylab='Energy sub metering', type='l', xlab='', xaxt='n')
lines(x=s, y=powersub$Sub_metering_2, col='red')
lines(x=s, y=powersub$Sub_metering_3, col='blue')
legend("topright", col=c('black', 'red', 'blue'),lwd=c(2.5,2.5,2.5), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))

# 3
plot(x=s, y=powersub$Voltage, xaxt='n', ylab='Voltage', type='l', xlab='datetime')
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))


# 4
plot(x=s, y=powersub$Global_reactive_power, xaxt='n', type='l', ylab='Global_reactive_power', xlab='datetime')
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))
dev.off()
