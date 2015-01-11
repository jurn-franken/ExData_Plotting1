# --- Reading in the data, converting the date and subsetting to 1st and 2nd of februari 2007.
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";")
unlink(temp)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

type# --- converting to numerics
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))



# --- Plotting the graph
png(filename="plot3.png", width=480, height=480)

plot(subdata$Sub_metering_1, type="l", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
lines(subdata$Sub_metering_2, col="Red")
lines(subdata$Sub_metering_3, col="Blue")
legend("topright",col=c("black", "blue", "red"), lwd=2, legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),cex=1.0, xjust=0, seg.len=1.5)

dev.off()
