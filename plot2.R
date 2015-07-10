#  read in data set
Power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# subset required dates from 2007-02-01 to 2007-02-02
# first convert Date variable to correct format:
Power$Date <- as.character(Power$Date)
Power$Date <- as.Date(Power$Date, "%d/%m/%Y")

PowerSet <- subset(Power, Power$Date >= "2007-02-01" & Power$Date <="2007-02-02")

#plot2:

#need new variable: date_time
PowerSet$Time <- as.character(PowerSet$Time)
PowerSet["date_time"] <- NA
PowerSet$date_time <- as.POSIXct(paste0(PowerSet$Date, PowerSet$Time, "00:00:00"))

png(filename="plot2.png")
plot(PowerSet$date_time,PowerSet$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(PowerSet$date_time,PowerSet$Global_active_power)
dev.off()
