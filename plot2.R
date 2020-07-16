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

# plot Global_active_power against datetime
png("plot2.png", width=480, height=480)
with(hpc, plot(datetime, Global_active_power, type= "l", xlab = "",
  ylab = "Global Active Power (kilowatts)"))
dev.off()
