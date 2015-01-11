# --- Reading in the data, converting the date and subsetting to 1st and 2nd of februari 2007.
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";")
unlink(temp)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# --- converting to numerics
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

png(filename="plot2.png", width=480, height=480)
plot(subdata$Global_active_power/500, type="l", ylab = "Global Active Power (kilowats)", xaxt="n", xlab="")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
 