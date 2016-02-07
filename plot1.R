#########################################
# plot1.R 
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

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(Feb1_2_2007_Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
print("plot1.png created")