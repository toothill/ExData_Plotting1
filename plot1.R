## Exploratory Data Analysis Project #1
## Plot #1

## Define Working Directory
work_dir <- "c:/Users/Toothill/Desktop/Course 4 - Exploratory Data Analysis/Project1/"

## Read data from file
usage <- read.table(paste(work_dir, "household_power_consumption.txt", sep = ""), sep = ";", header = TRUE)
usage$Date <- as.Date(usage$Date, format = "%d/%m/%Y")
## usage$Global_active_power[usage$Global_active_power == "?", "Global_active_power"] <- NA
usage$Global_active_power <- as.numeric(as.character(usage$Global_active_power))
usage$Global_reactive_power <- as.numeric(as.character(usage$Global_reactive_power))
usage$Voltage <- as.numeric(as.character(usage$Voltage))
usage$Global_intensity <- as.numeric(as.character(usage$Global_intensity))
usage$Sub_metering_1 <- as.numeric(as.character(usage$Sub_metering_1))
usage$Sub_metering_2 <- as.numeric(as.character(usage$Sub_metering_2))
usage$Sub_metering_3 <- as.numeric(as.character(usage$Sub_metering_3))

## Subset the data to include only Feb 1, 2007 & Feb 2, 2007
usage2 <- usage[(usage$Date == "2007-02-01") | (usage$Date == "2007-02-02"),]

hist(usage2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.copy(png, file = "c:/Users/Toothill/Desktop/Course 4 - Exploratory Data Analysis/Project1/plot1.png", width = 480, height = 480)
dev.off()
