## Create Plot 2 (Line Plot of Active Power)

library("dplyr")

hpwr2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors = FALSE)  %>%
    subset(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
           Date = as.Date(Date, "%d/%m/%Y"))

# Plot

png("plot2.png")

plot(hpwr2$datetime, hpwr2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
