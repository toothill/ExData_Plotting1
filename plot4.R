## Exploratory Data Analysis Project #1
## Plot #4

## Define Working Directory
work_dir <- "c:/Users/Toothill/Desktop/Course 4 - Exploratory Data Analysis/Project1/"

## Read data from file
usage <- read.table(paste(work_dir, "household_power_consumption.txt", sep = ""), sep = ";", header = TRUE)
usage$DateTime <- as.POSIXct(paste(usage$Date, usage$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")

## Translate factors to numeric values
usage$Global_active_power <- as.numeric(as.character(usage$Global_active_power))
usage$Global_reactive_power <- as.numeric(as.character(usage$Global_reactive_power))
usage$Voltage <- as.numeric(as.character(usage$Voltage))
usage$Global_intensity <- as.numeric(as.character(usage$Global_intensity))
usage$Sub_metering_1 <- as.numeric(as.character(usage$Sub_metering_1))
usage$Sub_metering_2 <- as.numeric(as.character(usage$Sub_metering_2))
usage$Sub_metering_3 <- as.numeric(as.character(usage$Sub_metering_3))

## Subset the data to include only Feb 1, 2007 & Feb 2, 2007
usage2 <- usage[(usage$Date == "2007-02-01") | (usage$Date == "2007-02-02"),]

## Generate plot 4
par(mfrow = c(2,2))
par(cex = 0.6)
plot(usage2$DateTime, usage2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
plot(usage2$DateTime, usage2$Voltage, type = "l", xlab = "datetime", ylab ="Voltage")
plot(usage2$DateTime, usage2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(usage2$DateTime, usage2$Sub_metering_2, col = "red")
lines(usage2$DateTime, usage2$Sub_metering_3, col = "blue")
legend(as.numeric(as.POSIXct("2007-02-01 17:00:00 EST")), 39, lty = c(1, 1, 1), text.width = 80000, col= c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.col = "transparent")
plot(usage2$DateTime, usage2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file = paste(work_dir, "plot4.png", sep = ""), width = 480, height = 480)
dev.off()

