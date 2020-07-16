# read in data
hpc <- read.table("household_power_consumption.txt", header=TRUE,
  sep=";", na.strings="?", colClasses = c("character", "character", "numeric",
  "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# convert dates to Date format
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# subset data for 2007-02-01 and 2007-02-02
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# plot histogram of Global_active_power
png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, col="red", main="Global Active Power",
  xlab="Global Active Power (kilowatts)")
dev.off()
