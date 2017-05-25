## Exploratory Data Assignment 1: Plot 1
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

## Create plot 1
hist(hhpc$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

## Creat PNG file
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()