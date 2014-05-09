plot2 <- function(){
  data <- read.table("./rawdata/household_power_consumption.txt", sep=";", header=TRUE, colClasses=rep("character", 9))
  data$dateTime <- paste(data$Date, data$Time)
  data$dateTime <- as.POSIXct(data$dateTime, format="%d/%m/%Y %H:%M:%S")
  data <- subset(data, dateTime >= as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S") & dateTime <= as.POSIXct("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S"))
  data[,3:9] <- sapply(data[, 3:9], as.numeric)
  png("./figure/plot2.png", width=480, height=480)
  plot(data$dateTime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)")
  dev.off()
  data
}