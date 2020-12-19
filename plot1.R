
### PREPARATION ###
setwd("C:/Users/user/Desktop/R Exercises")
###

### DOWNLOAD AND LOAD DATA ###
url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="C:./data.zip")
data<-subset(read.table(unzip("C:./data.zip"), header = T, sep = ";"), Date == "1/2/2007" | Date == "2/2/2007")
###

### PLOT 1 ###
data$Global_active_power<-as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (Kilowatts)", main = "Global Active Power")
title(main = "Global Active Power")
dev.off()
###