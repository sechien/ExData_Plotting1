#  file read
Sys.setlocale("LC_TIME", "en_US.UTF-8")
totaldata <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
totaldata$Date <- as.Date(totaldata$Date,"%d/%m/%Y")
subsetData <- subset(totaldata, totaldata$Date >= "2007-02-01" & totaldata$Date <= "2007-02-02")
subsetData$timeSeries <- paste(subsetData$Date, subsetData$Time)
subsetData$timeSeries<- strptime(subsetData$timeSeries, format = "%Y-%m-%d %H:%M:%S")

png(file="./plot4.png",height=480,width=480)

par(mfcol = c(2,2))
# plot 1
plot(subsetData$timeSeries, subsetData$Global_active_power, type = "l", xlab ="" , ylab = "Global Active Power(kilowatts)")

# plot 2
plot(subsetData$timeSeries, subsetData$Sub_metering_1 , type = "l", xlab ="" , ylab = "Energy sub metering")
lines(subsetData$timeSeries, subsetData$Sub_metering_2, type = "l", col ="red")
lines(subsetData$timeSeries, subsetData$Sub_metering_3, type = "l", col ="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=1)

# plot 3
plot(subsetData$timeSeries, subsetData$Voltage, type = "l", xlab ="datetime" , ylab = "Global Active Power(kilowatts)")

#plot 4
plot(subsetData$timeSeries, subsetData$Global_reactive_power, type = "l", xlab ="datetime" , ylab = "Global Active Power(kilowatts)")

dev.off()
