#Graph 1
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
png('plot1.png', width = 480, height = 480)
hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()
