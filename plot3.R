#READ

setwd("C:\\Users\\Admin\\Dropbox\\Coursera\\ExploratoryDataAnalysis\\Ass1")

#this puts the file into a variable called data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, na.strings=c("?"), sep=";")

#convert the date column to date formate
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset all dates from feb 1 and 2, 2007
subdata <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")

#add date to time column of subset and convert to timestamp with date and time
subdata$Time <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(subdata$Time, "%Y-%m-%d %H:%M:%S")


#PLOT

plot( subdata$Time, subdata$Sub_metering_1, type='l', ylab="Energy sub-metering", xlab="")
lines( subdata$Time, subdata$Sub_metering_2, type='l', col='red')
lines( subdata$Time, subdata$Sub_metering_3, type='l', col='blue')
legend("topright", legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black", "red", "blue"))

#output png file
dev.copy(png, "plot3.png")