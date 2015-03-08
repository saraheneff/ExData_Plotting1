# read into R
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", 
                   na.strings = "?")

# convert date and time
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

# select data
data2 = data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]

# merge date and time
data2$dt <- strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

# plot
png(filename = "plot4.png", width=480, height=480, units="px")
par(mfrow = c(2, 2))

## plot 1 
plot(data2$dt, data2$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

## plot 2
plot(data2$dt, data2$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

## plot 3
plot(data2$dt, data2$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(data2$dt, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$dt, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot 4
plot(data2$dt, data2$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()