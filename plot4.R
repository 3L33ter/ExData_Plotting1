#only load dates 2007-02-01 and 2007-02-02
#head is row 1, row 66638 1st row, row 69517 last row of the data I want
#read thru 2/2/2007
data_1 <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=69516)

#now throw away the days we don't want
data <- data_1[66637:69516,]

#paste concatenates the date and time columns, and strptime makes it into a date/time object for R
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

par(mfrow = c(2,2))

#top left plot
plot(datetime, data$Global_active_power, pch=".", col="white", xlab="", ylab="Global Active Power")
lines(datetime, data$Global_active_power)

#top right plot
plot(datetime, data$Voltage, pch=".", col="white", xlab="datetime", ylab="Voltage")
lines(datetime, data$Voltage)

#bottom left plot
plot(datetime, data$Sub_metering_1, pch=".", col="white", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_1, col="black")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("top", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", cex=0.6, pt.cex=1, lty=c(1,1), lwd=c(1,1), col=c("black","red","blue")) 

#bottom right plot
plot(datetime, data$Global_reactive_power, pch=".", col="white", xlab="datetime", ylab="Global_reactive_power")
lines(datetime, data$Global_reactive_power)

dev.copy(png, file="plot4.png")
dev.off()
