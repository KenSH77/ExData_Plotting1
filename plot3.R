library(dplyr)
setwd("D:/kenfile/personal/datascience/Exploratory/week1assignment")
fileConsumption <- "./household_power_consumption.txt"
dataConsumption <- read.table(fileConsumption, header=TRUE, sep=";")
a <- as.Date(dataConsumption[,1], format = "%d/%m/%Y")
dataConsumption <- cbind(dataConsumption, a)

DTime <- strptime(paste(dataConsumption$Date, dataConsumption$Time), "%d/%m/%Y %H:%M:%S")
dataConsumption <- cbind(dataConsumption, DTime)

dt1 <- as.Date("2007-02-01")
dt2 <- as.Date("2007-02-02")

dataCal <- filter(dataConsumption, a>=dt1 & a <=dt2)
plot(dataCal$DTime, dataCal$Sub_metering_1,  type="l", xlab="", ylab="Global Active Power (kilowatts)", col="black")
lines(dataCal$DTime, dataCal$Sub_metering_2, col="red")
lines(dataCal$DTime, dataCal$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1, text.font = 0.3)

dev.copy(png, file="./plot3.png", width=480, height=480)
dev.off()
