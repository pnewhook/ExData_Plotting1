power <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors=F)
power$Datef <- as.Date(power$Date, format='%d/%m/%Y')
powersub <- subset(power, (Datef >= '2007-02-01' & Datef <= '2007-02-02'))

powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

png('plot3.png')
powersub$Timef <- strptime(powersub$Time, format='%H:%M:%S')
s <- seq_along(powersub$Date)
plot(x=s, y=powersub$Sub_metering_1, ylab='Energy sub metering', type='l', xlab='', xaxt='n')
lines(x=s, y=powersub$Sub_metering_2, col='red')
lines(x=s, y=powersub$Sub_metering_3, col='blue')
legend("topright", col=c('black', 'red', 'blue'),lwd=c(2.5,2.5,2.5), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))
dev.off()
