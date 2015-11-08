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

# Plot 1
hist(globalActivePower, main="Global Active Power", xlab=" Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

# Save png device
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off()