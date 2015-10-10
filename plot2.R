#  file read
Sys.setlocale("LC_TIME", "en_US.UTF-8")
totaldata <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
totaldata$Date <- as.Date(totaldata$Date,"%d/%m/%Y")
subsetData <- subset(totaldata, totaldata$Date >= "2007-02-01" & totaldata$Date <= "2007-02-02")
subsetData$timeSeries <- paste(subsetData$Date, subsetData$Time)
subsetData$timeSeries<- strptime(subsetData$timeSeries, format = "%Y-%m-%d %H:%M:%S")

png(file="./plot2.png",height=480,width=480)

# plot
plot(subsetData$timeSeries, subsetData$Global_active_power, type = "l", xlab ="" , ylab = "Global Active Power(kilowatts)")
dev.off()