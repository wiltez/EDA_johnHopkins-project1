pd <- read.csv('household_power_consumption.txt', header = TRUE, sep = ";")

pd2 = subset(pd, pd$Date == "1/2/2007" | pd$Date == "2/2/2007")

pd2$Global_active_power <- as.numeric(as.character(pd2$Global_active_power))
pd2$Global_reactive_power <- as.numeric(as.character(pd2$Global_reactive_power))

png(file = "Plot1.png", width = 480, height = 480, units = "px")
hist(pd2$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Global Active power (kilowatts)',
     ylab = 'Frequency',
     ylim = range(0,1200),
     col = 'red')
dev.off()