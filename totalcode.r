## Code for Data_Analysis - Course Project 1

raw_data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings=c("?"))
sub_data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

## Check data in console with head & tail functions to verify correct date

## Depended on discussion board to get this conversion
data$DateTime = strptime(apply(sub_data[ ,c("Date","Time")],1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")


## Make Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


## Make Plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()


## Make Plot3
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_2,col = "red")
lines(data$DateTime,data$Sub_metering_3,col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1))
dev.off()


## Make Plot4  (lecture 25 @ 10:30)
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
	## plot 1
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
	## plot 2: y = voltage, x = datetime
plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")	
	## plot 3 (without legend border)
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_2,col = "red")
lines(data$DateTime,data$Sub_metering_3,col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1), bty = "n")
	## plot 4: y = Global_reactive_power, x = datetime
plot(data$DateTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")	
dev.off()