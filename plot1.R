#  file read
housedata <- read.csv2("./household_power_consumption.txt")
housedata$Date <- as.Date(housedata$Date,"%d/%m/%Y")
subsetData <- subset(housedata, housedata$Date >= "2007-02-01" & housedata$Date <= "2007-02-02")
subsetData$Global_active_power  <- as.numeric(as.character(subsetData$Global_active_power))

png(file="./plot1.png",height=480,width=480)
# plot
hist(subsetData$Global_active_power, col="red", main = paste("Global Active Power"), xlab = "Global Active Power(kilowatts)", ylab = "Frequency" )
dev.off()