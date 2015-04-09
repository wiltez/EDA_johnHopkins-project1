pd <- read.csv('household_power_consumption.txt', header = TRUE, sep = ";")
pd2 = subset(pd, pd$Date == "1/2/2007" | pd$Date == "2/2/2007")

pd2$Global_active_power <- as.numeric(as.character(pd2$Global_active_power))
pd2$Global_reactive_power <- as.numeric(as.character(pd2$Global_reactive_power))

pd2$Date3 <- as.character(pd2$Date)
pd2$Time3<- as.character(pd2$Time)
pd2$datetime <- strptime(paste(pd2$Date3, pd2$Time3), "%d/%m/%Y %H:%M:%S")

png(file = "Plot2.png", width = 480, height = 480, units = "px")

plot (x= pd2$datetime, y = pd2$Global_active_power,
      ylab = 'Global Active power (kilowatts)',
      xlab ='  ',
      type = "l")
dev.off()