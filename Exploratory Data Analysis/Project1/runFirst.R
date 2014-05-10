##Download and Unzip file

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url=fileURL, destfile="household_power_consumption.zip")
unzip(zipfile="household_power_consumption.zip", files="household_power_consumption.txt")

##Install and load sqldf package
install.packages("sqldf")
library(sqldf)

##only load dates 1st and 2nd February into power data frame
sqlString <- "select * from file WHERE Date in ('1/2/2007', '2/2/2007')"
power <- read.csv.sql(file="./household_power_consumption.txt", sql=sqlString, sep=";")

#transform date and time into completeDate
power$completeDate <- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

