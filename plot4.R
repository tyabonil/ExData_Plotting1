plot4 <- function(){
  data <- read.table("./rawdata/household_power_consumption.txt", sep=";", header=TRUE, colClasses=rep("character", 9))
  data$dateTime <- paste(data$Date, data$Time)
  data$dateTime <- as.POSIXct(data$dateTime, format="%d/%m/%Y %H:%M:%S")
  data <- subset(data, dateTime >= as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S") & dateTime <= as.POSIXct("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S"))
  data[,3:9] <- sapply(data[, 3:9], as.numeric)
  png("./figure/plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  plot(data$dateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  plot(data$dateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(data$dateTime, data$Sub_metering_2, col="red")
  lines(data$dateTime, data$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  plot(data$dateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
  plot(data$dateTime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
  dev.off()
  data
}