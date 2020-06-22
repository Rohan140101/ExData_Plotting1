library(lubridate)

table1 <- fread("household_power_consumption.txt")
table1$Date <- dmy(table1$Date)
table2 <- subset(table1,Date>="2007-02-01" & Date<="2007-02-02")
table2$Time <- as.ITime(table2$Time)

table2$Global_active_power <- as.numeric(table2$Global_active_power)
table2$Global_reactive_power <- as.numeric(table2$Global_reactive_power)
table2$Voltage <- as.numeric(table2$Voltage)
table2$Global_intensity <- as.numeric(table2$Global_intensity)
table2$Sub_metering_1 <- as.numeric(table2$Sub_metering_1)
table2$Sub_metering_2 <- as.numeric(table2$Sub_metering_2)

date_and_time <- strptime(paste(table2$Date,table2$Time),format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480,height = 480)
plot(x = date_and_time,y = table2$Sub_metering_1,xlab = "",ylab = "Energy Sub Metering",type = "l")
lines(x = date_and_time,y = table2$Sub_metering_2,col = "red")
lines(x = date_and_time,y = table2$Sub_metering_3,col = "blue")

legend("topright",lty = 1,lwd = 1,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"))

dev.off()