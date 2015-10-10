plot2 <- function () {
        data_set <- read.table("household_power_consumption.txt", sep = ";")
        names(data_set) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                             "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                             "Sub_metering_3")
        data_set <- as.matrix(data_set)
        data_set <- data_set[2:nrow(data_set), ]
        data_set <- data_set[as.Date(data_set[, 1], "%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y"), ]
        data_set <- data_set[as.Date(data_set[, 1], "%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"), ]
        data_set <- cbind(data_set, paste(as.Date(data_set[, 1], "%d/%m/%Y"), data_set[, 2]))
        plot(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 3], 
             xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
        lines(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 3])

        dev.copy(png, "plot2.png")
        dev.off()
}