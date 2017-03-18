## Load file in R
file <- "./household_power_consumption.txt"

## Reads a file in table format and creates a data frame 
alldata <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

## Subset the data
subsetalldata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

## Converts character vectors
changedatetime <- strptime(paste(subsetalldata$Date, subsetalldata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Return data as numeric
gap <- as.numeric(subsetalldata$Global_active_power)

submetering1 <- as.numeric(subsetalldata$Sub_metering_1)
submetering2 <- as.numeric(subsetalldata$Sub_metering_2)
submetering3 <- as.numeric(subsetalldata$Sub_metering_3)

voltage <- as.numeric(subsetalldata$Voltage)

grp <- as.numeric(subsetalldata$Global_reactive_power)

## Make screen 2 by 2
par(mfcol = c(2,2))

## Plot all 4 line charts with labels and legend
plot(changedatetime, gap, type = "l", ylab = "Global Active Power", xlab = "")

plot(changedatetime, submetering1, type="l", ylab = "Energy sub metering", xlab = "")
lines(changedatetime, submetering2, type = "l", col = "red")
lines(changedatetime, submetering3, type = "l", col = "blue")
## Inserting the Legend at the top right
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

plot(changedatetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(changedatetime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Copy plot to PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

## Close off PNG device
dev.off()