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

png("plot1.png", width = 480,height = 480)
hist(table2$Global_active_power,xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")
dev.off()