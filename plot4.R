# --- Reading in the data, converting the date and subsetting to 1st and 2nd of februari 2007.
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";")
unlink(temp)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# --- converting to numerics
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
subdata$Global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))
subdata$Voltage <- as.numeric(as.character(subdata$Voltage))
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))

png(filename="plot4.png", width=480, height=480)
# plot in a 2 by 2 matrix, row wise
par(mfrow = c(2,2))

# first plot nr 2 again
plot(subdata$Global_active_power, type="l", ylab = "Global Active Power (kilowats)", xaxt="n", xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

# New voltage plot
plot(subdata$Voltage, type="l", ylab = "Voltage", xaxt="n", xlab="datetime")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

# plot 3 again
plot(subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
lines(subdata$Sub_metering_2, col="Red")
lines(subdata$Sub_metering_3, col="Blue")
legend("topright",col=c("black", "blue", "red"), lwd=2, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=1.0, xjust=0, seg.len=1.5)

# plot 4
plot(subdata$Global_reactive_power, type="l",ylab = "Global_reactive_power", xaxt="n", xlab="datetime")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

dev.off()







