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

# starting the plot

par(mfrow=c(2,2))

barplot(a, beside = T,col = 1:6, space = c(0, 2))

plot(dataCal$DTime, dataCal$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(dataCal$DTime, dataCal$Voltage,  type="l", xlab="datetime", ylab="Global Active Power (kilowatts)")


plot(dataCal$DTime, dataCal$Sub_metering_1,  type="l", xlab="", ylab="Global Active Power (kilowatts)", col="black")
lines(dataCal$DTime, dataCal$Sub_metering_2, col="red")
lines(dataCal$DTime, dataCal$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pch=21, cex=0.5)

plot(dataCal$DTime, dataCal$Global_reactive_power,  type="n", xlab="datetime", ylab="Global Power (kilowatts)")
lines(dataCal$DTime, dataCal$Global_reactive_power, col="black")

dev.copy(png, file="./plot4.png", width=480, height=480)
dev.off()
