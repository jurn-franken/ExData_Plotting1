# --- Reading in the data, converting the date and subsetting to 1st and 2nd of februari 2007.
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ";")
unlink(temp)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

# --- converting to numerics
subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))

# --- Generatin plot
png(filename="plot1.png", width=480, height=480)
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "Red")
dev.off()
