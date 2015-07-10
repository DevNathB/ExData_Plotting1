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

#plot4:

png(filename="plot4.png")

par(mfrow = c(2,2), mar=c(6,5,2,2))

plot(PowerSet$date_time,PowerSet$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(PowerSet$date_time,PowerSet$Global_active_power)

plot(PowerSet$date_time,PowerSet$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(PowerSet$date_time,PowerSet$Voltage)

plot(PowerSet$date_time,PowerSet$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(PowerSet$date_time,PowerSet$Sub_metering_1)
lines(PowerSet$date_time,PowerSet$Sub_metering_2,col="red")
lines(PowerSet$date_time,PowerSet$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(PowerSet$date_time,PowerSet$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(PowerSet$date_time,PowerSet$Global_reactive_power)

dev.off()

