#  read in data set
Power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")

# subset required dates from 2007-02-01 to 2007-02-02
# first convert Date variable to correct format:
Power$Date <- as.character(Power$Date)
Power$Date <- as.Date(Power$Date, "%d/%m/%Y")

PowerSet <- subset(Power, Power$Date >= "2007-02-01" & Power$Date <="2007-02-02")

#plot1:

png(filename="plot1.png")
hist(PowerSet$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()

