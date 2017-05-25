## Exploratory Data Assignment 1: Plot 3
## Download data from this link and place in your working directory
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

library(lubridate)
## Read data file
ecdata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
                     colClasses = c("character","character",rep("numeric",7)),
                                                       na.strings="?")
## Select the two days of data for plotting
hhpc <- ecdata[ecdata$Date=="1/2/2007" |  ecdata$Date=="2/2/2007",]

## Set dates in correct format
hhpc$DT <- dmy_hms(paste(hhpc$Date,hhpc$Time))

## Create plot 3

plot(hhpc$DT,hhpc$Sub_metering_1,type="l",ylab= "Energy Sub Metering")
lines(hhpc$DT,hhpc$Sub_metering_2)
lines(hhpc$DT,hhpc$Sub_metering_2,col="red")
lines(hhpc$DT,hhpc$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

## Create PNG File
dev.copy(png,file="plot3.png",width=480, height=480)
dev.off()