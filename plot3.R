plot3 <- function () {
        data_set <- read.table("household_power_consumption.txt", sep = ";")
        names(data_set) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                             "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                             "Sub_metering_3")
        data_set <- as.matrix(data_set)
        data_set <- data_set[2:nrow(data_set), ]
        data_set <- data_set[as.Date(data_set[, 1], "%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y"), ]
        data_set <- data_set[as.Date(data_set[, 1], "%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"), ]
        data_set <- cbind(data_set, paste(as.Date(data_set[, 1], "%d/%m/%Y"), data_set[, 2]))
        plot(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 7], 
             xlab = "", ylab = "Energy sub metering", type = "n")
        lines(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 7])
        lines(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 8], col = "red")
        lines(as.POSIXct(data_set[, 10], "%d/%m/%Y %H:%M:%S"), data_set[, 9], col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 1)

        dev.copy(png, "plot3.png")
        dev.off()
}