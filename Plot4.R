pd <- read.csv('household_power_consumption.txt', header = TRUE, sep = ";")
pd2 = subset(pd, pd$Date == "1/2/2007" | pd$Date == "2/2/2007")

pd2$Global_active_power <- as.numeric(as.character(pd2$Global_active_power))
pd2$Global_reactive_power <- as.numeric(as.character(pd2$Global_reactive_power))

pd2$Voltage <- as.numeric(as.character(pd2$Voltage))


pd2$Date3 <- as.character(pd2$Date)
pd2$Time3<- as.character(pd2$Time)
pd2$datetime <- strptime(paste(pd2$Date3, pd2$Time3), "%d/%m/%Y %H:%M:%S")

pd2$Sub_metering_1 <- as.numeric(as.character(pd2$Sub_metering_1))
pd2$Sub_metering_2 <- as.numeric(as.character(pd2$Sub_metering_2))

png(file = "Plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
par(mar = c(4,4,2,1))

plot (x= pd2$datetime, y = pd2$Global_active_power,
      ylab = 'Global Active power (kilowatts)',
      xlab ='  ',
      type = "l")

plot (x= pd2$datetime, y = pd2$Voltage,
      ylab = 'Voltage',
      xlab ='datetime',
      type = "l")

plot (x= pd2$datetime, y = pd2$Sub_metering_1,
      ylab = 'Energy sub metering',
      xlab ='  ',
      type = "l")
legend("topright" , bty = "n", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(x= pd2$datetime, y = pd2$Sub_metering_2, col = "red")
lines(x= pd2$datetime, y = pd2$Sub_metering_3, col = "blue")

plot (x= pd2$datetime, y = pd2$Global_reactive_power,
      ylab = 'Global_reactive_power',
      xlab ='datetime',
      ylim = range(0,0.5),
      type = "l")

dev.off()