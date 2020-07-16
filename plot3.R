# read in data
hpc <- read.table("household_power_consumption.txt", header=TRUE,
  sep=";", na.strings="?", colClasses = c("character", "character", "numeric",
  "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# convert dates to Date format
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# subset data for 2007-02-01 and 2007-02-02
hpc <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")

# create DateTime variable
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

# plot sub metering data against datetime
png("plot3.png", width=480, height=480)
with(hpc, plot(datetime, Sub_metering_1, type= "l", xlab = "", ylab = "Energy sub metering"))
with(hpc, lines(datetime, Sub_metering_2, col = "red"))
with(hpc, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
dev.off()
