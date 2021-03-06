#Graph 3
library(lubridate)

#Getting the data
mydata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Formatting the date
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")

#subsetting
subdata <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

#Getting the weekdays
subdata$day <- weekdays(subdata$Date)

#Getting the time in proper format
subdata$test1 <- paste(subdata$Date, subdata$Time)
class(subdata$test1)
subdata$test1 <- strptime(subdata$test1, format = "%Y-%m-%d %H:%M:%S")

####################################
#We can now generate the graphs.

png('plot3.png', height = 480, width = 480)
plot(subdata$test1, subdata$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(subdata$test1, subdata$Sub_metering_1)
lines(subdata$test1, subdata$Sub_metering_2, col = "red")
lines(subdata$test1, subdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1) )
dev.off()

