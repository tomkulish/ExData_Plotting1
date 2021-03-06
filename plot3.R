#########################################
# plot3.R 
# 6 Feb 2016
# NOTE: This has been created to work on a Windows machine (notice backslashes)
#########################################

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(file.exists("household_power_consumption.zip")) {
  print("File is already downloaded")
} else {
  download.file(url=fileURL, destfile=".\\household_power_consumption.zip", method="auto")
  print("Downloaded household_power_consumption.zip")
}

if(file.exists("household_power_consumption.txt")) {
  print("txt file already exists")
} else {
  unzip(zipfile="household_power_consumption.zip")
  print("unziped household_power_consumption.zip")
}


data <-read.csv("./household_power_consumption.txt", na.strings= "?", sep=";")
#head(data, n=5)

Feb1_2_2007_Data <- subset.data.frame(data, Date == "1/2/2007" | Date == "2/2/2007")
#head(Feb1_2_2007_Data, n=5)
Feb1_2_2007_Data$datetime <- strptime(paste(Feb1_2_2007_Data$Date,Feb1_2_2007_Data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
#Feb1_2_2007_Data$date <- as.Date(Feb1_2_2007_Data$Date,format="%d/%m/%Y")
png(filename = "plot3.png", width = 480, height = 480, units = "px")

with(Feb1_2_2007_Data, plot(y=Sub_metering_1,x=datetime, type = "n",xlab ="", ylab="Energy sub metering"))
with(Feb1_2_2007_Data, lines(y=Sub_metering_1,x=datetime,col="black"))
with(Feb1_2_2007_Data, lines(y=Sub_metering_2,x=datetime,col="red"))
with(Feb1_2_2007_Data, lines(y=Sub_metering_3,x=datetime,col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
print("plot3.png created")