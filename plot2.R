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
plot(dataCal$DTime, dataCal$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="./plot2.png", width=480, height=480)
dev.off()
