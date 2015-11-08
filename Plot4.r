#Exploratory Data Analysis (Project 1)

# Read the original dataset: first set your working directory 
# and download there the dataset
setwd("C:/Users/Maria Jesus/Desktop/Formación R/Curso Exploratory  Data Analysis/Week 1/Project 1")

data_orig<- read.table ("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data_orig$DateTime<- paste(data_orig$Date,data_orig$Time)

# We are only using data from these dates 2007-02-01 & 2007-02-02
sub_data <- data_orig[data_orig$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data_orig)

# Convert Dates
datetime <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(sub_data$Global_active_power)
globalReactivePower <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
subMetering1 <- as.numeric(sub_data$Sub_metering_1)
subMetering2 <- as.numeric(sub_data$Sub_metering_2)
subMetering3 <- as.numeric(sub_data$Sub_metering_3)

# Plot 4
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="voltage")
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Save png device
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off()