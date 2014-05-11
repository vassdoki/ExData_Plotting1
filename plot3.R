if (! file.exists("data.txt")) {
  message("Please download, unzip and filter the data file from here:")
  message("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
  message("data.txt should contain the header, and rows from 2007-02-01 and 2007-02-02")
}

data = read.csv(
  "data.txt", 
  header=TRUE, 
  sep=";",
  quote="", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

times <- strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M")

par(mfrow = c(1,1))
par(cex = 0.75)

plot(
  times,
  data$Sub_metering_1, 
  type="n", 
  xlab="", 
  ylab="Energi sub metering"
)
points(times,data$Sub_metering_1, type="l")
points(times,data$Sub_metering_2, type="l", col="red")
points(times,data$Sub_metering_3, type="l", col="blue")
legend("topright", 
       pch="-",
       col = c("black", "red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
)
dev.copy(png, file = "plot3.png")
dev.off() 