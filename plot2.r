## Code for Data_Analysis - Course Project 1

## Read data
raw_data <- read.table("household_power_consumption.txt", sep = ";", header = T, na.strings=c("?"))
sub_data <- subset(raw_data, Date == "1/2/2007" | Date == "2/2/2007")

data$DateTime = strptime(apply(sub_data[ ,c("Date","Time")],1, paste, collapse=" "), "%d/%m/%Y %H:%M:%S")

## Make Plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
