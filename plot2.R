## Load file in R
file <- "./household_power_consumption.txt"

## Reads a file in table format and creates a data frame 
alldata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data
subsetalldata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

## Converts character vectors
changedatetime <- strptime(paste(subsetalldata$Date, subsetalldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## Return data as numeric
gap <- as.numeric(subsetalldata$Global_active_power)

## Plot line chart with y axis label
plot(changedatetime, gap, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Copy plot to PNG file
dev.copy(png, file="plot2.png", height=480, width=480)

## Close off PNG device
dev.off()