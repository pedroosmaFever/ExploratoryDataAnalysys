library(datasets)

household <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, nrows=5, na.strings = "?")
classes <- sapply(household, class)
household <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings = "?")

#prepare the data
household_sub <- household[household$Date=="1/2/2007" | household$Date=="2/2/2007",]
household_sub$DateTime <- strptime(paste(household_sub$Date, household_sub$Time), format = "%d/%m/%Y %H:%M:%S")
household_sub$Date <- as.Date(household_sub$Date, format = "%d/%m/%Y")
household_sub$Time <- strptime(household_sub$Time, format = "%H:%M:%S")

png(filename="plot1.png")

#create the graphic
hist(household_sub$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()