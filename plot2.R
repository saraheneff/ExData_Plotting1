# read into R
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", 
                   na.strings = "?")

# convert date and time
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
data$Time = strptime(data$Time, format = "%H:%M:%S")

# select data
data2 = data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),]

# merge date and time
ata2$dt <- strptime(paste(data2$Date, data2$Time), format = "%Y-%m-%d %H:%M:%S")

# plot
png(filename = "plot2.png")
plot(data2$dt, data2$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()