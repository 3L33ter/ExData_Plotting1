#only load dates 2007-02-01 and 2007-02-02
#head is row 1, row 66638 1st row, row 69517 last row of the data I want
#so keep head, skip 66636, and read 2880 rows

#this gives the wrong header
#data_1 <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880)

#this works
data_1 <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=69516)

#we have days X thru 2/2/2007 so throw away the days we don't want
data <- data_1[66637:69516,]

#paste concatenates the date and time columns, and strptime makes it into a date/time object for R
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

plot(datetime, data$Sub_metering_1, pch=".", col="white", xlab="", ylab="Energy sub metering")
lines(datetime, data$Sub_metering_1, col="black")
lines(datetime, data$Sub_metering_2, col="red")
lines(datetime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75, lty=c(1,1), lwd=c(1,1), col=c("black","red","blue")) 
dev.copy(png, file="plot3.png")
dev.off()
