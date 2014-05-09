week1 <- function(sd="Mon", ed="Sun"){
  sd <- 60*60*24
  wd <- list(Sun=0*sd, Mon=1*sd, Tue=2*sd, Wed=3*sd, Thu=4*sd, Fri=5*sd, Sat=6*sd) 
  setClass("myDate")
  setClass("myTime")
  setClass("myNumber")
  setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
  setAs("character","myTime", function(from) strptime(from, format="%H:%M:%S") )
  setAs("character","myNumber", function(from) as.numeric(from) )
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("myDate","myTime", rep("myNumber", 7)))
  data$days <- weekdays(data$Date, abbreviate=TRUE)
  data$custom <- sapply(seq_len(nrow(data)), function(x) wd[[data$days[x]]] + data$Time[x])
  png("./output/plot%d.png", width=480, height=480)
  hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
  dev.off()
  data
}