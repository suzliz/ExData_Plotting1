## Exploratory Data Assignment 1: Plot 2
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

## Create plot 2
plot(hhpc$DT,hhpc$Global_active_power,type="l",
     ylab="Global Active Power",
     main = "Global Active Power over two days")

##Create PNG file
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()