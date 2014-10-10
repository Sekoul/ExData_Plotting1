#READ

setwd("C:\\Users\\Admin\\Dropbox\\Coursera\\ExploratoryDataAnalysis\\Ass1")

#this puts the file into a variable called data
data <- read.table("household_power_consumption.txt", header=TRUE, stringsAsFactors=FALSE, na.strings=c("?"), sep=";")

#convert the date column to date format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#subset all dates from feb 1 and 2, 2007
subdata <- subset(data, Date == "2007/02/01" | Date == "2007/02/02")

#add date to time column of subset and convert to timestamp with date and time
subdata$Time <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(subdata$Time, "%Y-%m-%d %H:%M:%S")


#PLOT

with(subdata, hist(subdata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))


#output png file
dev.copy(png, "plot1.png")