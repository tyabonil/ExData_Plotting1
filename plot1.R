## This function will read data for the timeframe 1/2/07-2/2/07 from the assigned data sate (not included in repo due to size)
## The plot is a histogram of Global Active Power saved to a transp. png in the figure directory

plot1 <- function(){
  data <- read.table("./rawdata/household_power_consumption.txt", sep=";", header=TRUE, colClasses=rep("character", 9))
  data$dateTime <- paste(data$Date, data$Time)
  data$dateTime <- as.POSIXct(data$dateTime, format="%d/%m/%Y %H:%M:%S")
  data <- subset(data, dateTime >= as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S") & dateTime <= as.POSIXct("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S"))
  data[,3:9] <- sapply(data[, 3:9], as.numeric)
  png("./figure/plot1.png", width=480, height=480, bg = "transparent")
  hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
  data
}