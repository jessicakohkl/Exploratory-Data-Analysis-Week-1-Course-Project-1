## Load file in R
file <- "./household_power_consumption.txt"

## Reads a file in table format and creates a data frame 
alldata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset the data
subsetalldata <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]

## Return data as numeric
gap <- as.numeric(subsetalldata$Global_active_power)

## Plot histogram with x and y axis labels and fill it red
hist(gap, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy plot to PNG file
dev.copy(png, file="plot1.png", height=480, width=480)

## Close off PNG device
dev.off()