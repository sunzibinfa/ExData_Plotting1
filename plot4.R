#Read in Energy data set
energy <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#Subset data set for observations in 1/2/2007 and 2/2/2007 only
energy2 <- subset(energy, Date %in% c("1/2/2007","2/2/2007"))

#Create variable with Date and Time combined
energy2$DateTime <- strptime(paste(energy2$Date, energy2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert Global active power, Global reactive power, voltage and submetering variables into numeric
energy2$Global_active_power <- as.numeric(energy2$Global_active_power)
energy2$Global_reactive_power <- as.numeric(energy2$Global_reactive_power)
energy2$Voltage <- as.numeric(energy2$Voltage)
energy2$Sub_metering_1 <- as.numeric(energy2$Sub_metering_1)
energy2$Sub_metering_2 <- as.numeric(energy2$Sub_metering_2)
energy2$Sub_metering_3 <- as.numeric(energy2$Sub_metering_3)

#Create 4 graphs on one panel
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(energy2$DateTime, energy2$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(energy2$DateTime, energy2$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(energy2$DateTime, energy2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
  lines(energy2$DateTime, energy2$Sub_metering_2, type="l", col="red")
  lines(energy2$DateTime, energy2$Sub_metering_3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.25, col=c("black", "red", "blue"), bty="n")
plot(energy2$DateTime, energy2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
