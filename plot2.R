#only load dates 2007-02-01 and 2007-02-02
#head is row 1, row 66638 1st row, row 69517 last row of the data I want
#read thru 2/2/2007
data_1 <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", nrows=69516)

#now throw away the days we don't want
data <- data_1[66637:69516,]

#paste concatenates the date and time columns, and strptime makes it into a date/time object for R
datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y%H:%M:%S")

plot(datetime, data$Global_active_power, pch=".", col="white", xlab="", ylab="Global Active Power (kilowatts)")
lines(datetime, data$Global_active_power)
dev.copy(png, file="plot2.png")
dev.off()
