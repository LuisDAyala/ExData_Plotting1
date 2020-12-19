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

### PLOT 2 ###
png("plot2.png", width=480, height=480)
plot(data$datetime,data$Global_active_power, type="l", ylab = "Global Active Power (Kilowatts)", xlab="")
dev.off()
