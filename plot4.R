# Read the first 100k data
data100k <- read.table("~/Explordata/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows=100000)

# Change class of Date and Time, then add new variable called DateTime
data100k$Date <- as.Date(as.character(data100k$Date), format = "%d / %m / %Y")
data100k$Time <- as.character(data100k$Time)
data100k$DateTime <- with(data100k, as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

# Subset data to be only 2017-02-01 and 2017-02-02 
datause <- subset(data100k, Date >= "2007-02-01" & Date <= "2007-02-02")

# Make plot 4
par(mfrow = c(2,2), bg=NA)

with(datause, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, col = "black",type = "l", ylim = range(c(Sub_metering_1)), xlab = "", ylab = "Energy Sub Metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.75)
  plot(DateTime, Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")
  })

# Save plot 4 to png
png(file = "~/GitHub/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2), bg=NA)
with(datause, {
  plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime, Voltage, type ="l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, col = "black",type = "l", ylim = range(c(Sub_metering_1)), xlab = "", ylab = "Energy Sub Metering")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.75)
  plot(DateTime, Global_reactive_power, type ="l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()