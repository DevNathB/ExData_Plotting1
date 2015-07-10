#  read in data set
Power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# subset required dates from 2007-02-01 to 2007-02-02
# first convert Date variable to correct format:
Power$Date <- as.character(Power$Date)
Power$Date <- as.Date(Power$Date, "%d/%m/%Y")

PowerSet <- subset(Power, Power$Date >= "2007-02-01" & Power$Date <="2007-02-02")


#need new variable: date_time
PowerSet$Time <- as.character(PowerSet$Time)
PowerSet["date_time"] <- NA
PowerSet$date_time <- as.POSIXct(paste0(PowerSet$Date, PowerSet$Time, "00:00:00"))


#plot3:

png(filename="plot3.png")
plot(PowerSet$date_time,PowerSet$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(PowerSet$date_time,PowerSet$Sub_metering_1)
lines(PowerSet$date_time,PowerSet$Sub_metering_2,col="red")
lines(PowerSet$date_time,PowerSet$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()


