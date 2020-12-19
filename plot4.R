### PREPARATION ###
setwd("C:/Users/user/Desktop/R Exercises")
library(dplyr)
###

### DOWNLOAD AND LOAD DATA ###
url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="C:./data.zip")
data<-subset(read.table(unzip("C:./data.zip"), header = T, sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")
data <- data%>%
  mutate(datetime = strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
###

### PLOT 4 ###
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$datetime,data$Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)", xlab="")
plot(data$datetime, data$Voltage, type ="l", ylab = "Voltage", xlab= "datetime")
plot(y=data$Sub_metering_1, x=data$datetime, type="l", ylab = "Energy sub metering", xlab="")
lines(data$Sub_metering_2, x=data$datetime, type="l", col="red")
lines(data$Sub_metering_3, x=data$datetime, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, cex=0.5)
plot(data$datetime, data$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab="datetime")
dev.off()
