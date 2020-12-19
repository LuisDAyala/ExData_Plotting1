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

### PLOT 3 ###
png("plot3.png", width=480, height=480)
plot(y=data$Sub_metering_1, x=data$datetime, type="l", ylab = "Energy sub metering", xlab="")
lines(data$Sub_metering_2, x=data$datetime, type="l", col="red")
lines(data$Sub_metering_3, x=data$datetime, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()
###