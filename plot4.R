dataset <- read.csv("household_power_consumption.txt",sep=";")
dataset <- as.vector(dataset)

# Doing a string comparison first to subset the dataset
dataset <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]
dataset$datetime <- paste(dataset$Date, dataset$Time, sep= " ")
dataset$datetime <- strptime(dataset$datetime, "%d/%m/%Y %H:%M:%S")

png(filename = 'plot4.png', width = 480, height = 480, units = 'px')
par(mfrow=c(2,2))


with(dataset, plot(datetime, Global_active_power, pch="", ylab= "Global Active Power (kilowatts)", xlab = ""))
with(dataset, lines(datetime, Global_active_power))

with(dataset, plot(datetime, as.double(as.vector(Voltage)), xlab = "datetime", ylab="Voltage", pch=""))
with(dataset, lines(datetime, Global_active_power))


with(dataset, plot(datetime, Sub_metering_1, ylim = c(0,40), pch="", ylab= "Energy sub metering", xlab = ""))
with(dataset, lines(datetime, as.double(as.vector(Sub_metering_1))))
with(dataset, lines(datetime, as.double(as.vector(Sub_metering_2)), col = "red"))
with(dataset, lines(datetime, as.double(as.vector(Sub_metering_3)), col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1, cex=0.75)


with(dataset, plot(datetime, as.double(as.vector(dataset$Global_reactive_power)), pch="", ylab= "Global_reactive_power", xlab = "datetime"))
with(dataset,lines(datetime, as.double(as.vector(Global_reactive_power))))

dev.off()