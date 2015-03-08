# read into R
data <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", 
                   na.strings = "?")
# check data classes to see how to convert date format
str(data)

# convert date and time
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
## can't seem to get this to work:  data$Time = strptime(data$Time, format = "%HH:%MM:%SS")

# select data
data2 <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"),]

# check date to ensure correctly formatted and selected
str(data2)

# plot
png(filename = "plot1.png")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()