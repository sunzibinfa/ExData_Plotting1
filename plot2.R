#Read in Energy data set
energy <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#Subset data set for observations in 1/2/2007 and 2/2/2007 only
energy2 <- subset(energy, Date %in% c("1/2/2007","2/2/2007"))

#Create variable with Date and Time combined
energy2$DateTime <- strptime(paste(energy2$Date, energy2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Convert Global active power variable into numeric
energy2$Global_active_power <- as.numeric(energy2$Global_active_power)

#Create graph
png("plot2.png", width=480, height=480)
plot(energy2$DateTime, energy2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()