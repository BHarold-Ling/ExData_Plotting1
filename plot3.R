## Create Plot 3 (Line plot of submetering)

library("dplyr")

hpwr2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors = FALSE)  %>%
    subset(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
           Date = as.Date(Date, "%d/%m/%Y"))

# Plot

png("plot3.png")

plot(hpwr2$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(hpwr2$Sub_metering_2, type = "l", col = "red")
lines(hpwr2$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()