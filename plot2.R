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

par(mfrow = c(1,1))
par(cex = 0.75)

plot(
  strptime(paste(data[,1],data[,2]), "%d/%m/%Y %H:%M"),
  data$Global_active_power, 
  type="l", 
  xlab="", 
  ylab="Global Active Power (kilowatts)"
)

dev.copy(png, file = "plot2.png")
dev.off() 