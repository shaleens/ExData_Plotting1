dataset <- read.csv("household_power_consumption.txt",sep=";")
dataset <- as.vector(dataset)

# Doing a string comparison first to subset the dataset
dataset <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]
dataset$dateAndTime <- paste(dataset$Date, dataset$Time, sep= " ")
dataset$dateAndTime <- strptime(dataset$dateAndTime, "%d/%m/%Y %H:%M:%S")
par(new=F)
png(filename = 'plot3.png', width = 480, height = 480, units = 'px')
with(dataset, plot(dateAndTime, Sub_metering_1, ylim = c(0,40), pch="", ylab= "Energy sub metering", xlab = ""))
with(dataset, lines(dateAndTime, as.double(as.vector(Sub_metering_1))))
with(dataset, lines(dateAndTime, as.double(as.vector(Sub_metering_2)), col = "red"))
with(dataset, lines(dateAndTime, as.double(as.vector(Sub_metering_3)), col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1, cex=0.75)

dev.off()