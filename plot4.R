## Create Plot 4 (Four line plots)

library("dplyr")

hpwr2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors = FALSE)  %>%
    subset(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
           Date = as.Date(Date, "%d/%m/%Y"))

# Plot

png("plot4.png")

par(mfrow = c(2,2))

# Panel 1

plot(hpwr2$datetime, hpwr2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Panel 2

plot(hpwr2$datetime, hpwr2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Panel 3

plot(hpwr2$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(hpwr2$Sub_metering_2, type = "l", col = "red")
lines(hpwr2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)


# Panel 4

plot(hpwr2$datetime, hpwr2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

