library(datasets)

household <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, nrows=5, na.strings = "?")
classes <- sapply(household, class)
household <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings = "?")

#prepare the data
household_sub <- household[household$Date=="1/2/2007" | household$Date=="2/2/2007",]
household_sub$DateTime <- strptime(paste(household_sub$Date, household_sub$Time), format = "%d/%m/%Y %H:%M:%S")
household_sub$Date <- as.Date(household_sub$Date, format = "%d/%m/%Y")
household_sub$Time <- strptime(household_sub$Time, format = "%H:%M:%S")

png(filename="plot3.png")

#create the graphic
plot(household_sub$DateTime, household_sub$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(household_sub$DateTime, household_sub$Sub_metering_1, type="l")
points(household_sub$DateTime, household_sub$Sub_metering_2, type="l", col="red")
points(household_sub$DateTime, household_sub$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)

dev.off()