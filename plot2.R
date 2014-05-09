power <- read.csv2('household_power_consumption.txt', sep=';', stringsAsFactors=F)
power$Datef <- as.Date(power$Date, format='%d/%m/%Y')
powersub <- subset(power, (Datef >= '2007-02-01' & Datef <= '2007-02-02'))

powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

png('plot2.png')
powersub$Timef <- strptime(powersub$Time, format='%H:%M:%S')
s <- seq_along(powersub$Date)
plot(x=s, y=powersub$Global_active_power, ylab='Global Active Power (kilowatts)', type='l', xlab='', xaxt='n')
axis(1, at=c(min(s), median(s), max(s)), labels=c('Thu', 'Fri', 'Sat'))
dev.off()
