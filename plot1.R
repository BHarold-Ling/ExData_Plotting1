## Create Plot 1 (Histogram of Active Power)

library("dplyr")

# Read and clean data

# hpwr <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
#                    na.strings = "?", stringsAsFactors = FALSE)
# 
# hpwr1 <- subset(hpwr, Date %in% c("1/2/2007", "2/2/2007"))
# 
# hpwr2 <- mutate(hpwr1, datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")), Date = as.Date(Date, "%d/%m/%Y"))

hpwr2 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   na.strings = "?", stringsAsFactors = FALSE)  %>%
    subset(Date %in% c("1/2/2007", "2/2/2007")) %>%
    mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
           Date = as.Date(Date, "%d/%m/%Y"))

# Plot

png("plot1.png")

hist(hpwr2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

