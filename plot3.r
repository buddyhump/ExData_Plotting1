## Code for Data_Analysis - Course Project 1

## Read data
raw_data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings=c("?"))
sub_data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime = strptime(apply(sub_data[ ,c("Date","Time")],1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

## Make Plot3
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime,data$Sub_metering_2,col = "red")
lines(data$DateTime,data$Sub_metering_3,col = "blue")
legend("topright", col = c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty = c(1,1))
dev.off()
