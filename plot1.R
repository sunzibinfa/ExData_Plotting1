#Read in Energy data set
energy <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

#Subset data set for observations in 1/2/2007 and 2/2/2007 only
energy2 <- subset(energy, Date %in% c("1/2/2007","2/2/2007"))

#Convert Date variable to date format
energy2$Date <- as.Date(energy2$Date, format="%d/%m/%Y")

#Convert Global active power variable into numeric
energy2$Global_active_power <- as.numeric(energy2$Global_active_power)

#Create graph
png("plot1.png", width=480, height=480)
hist(energy2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()