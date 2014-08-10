dataset <- read.csv("household_power_consumption.txt",sep=";")
dataset <- as.vector(dataset)

# Doing a string comparison first to subset the dataset
dataset <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]
dataset$dateAndTime <- paste(dataset$Date, dataset$Time, sep= " ")
dataset$dateAndTime <- strptime(dataset$dateAndTime, "%d/%m/%Y %H:%M:%S")
png(filename = 'plot2.png', width = 480, height = 480, units = 'px')
with(dataset, plot(dateAndTime, Global_active_power, pch="", ylab= "Global Active Power (kilowatts)", xlab = ""))
with(dataset, lines(dateAndTime, Global_active_power))
dev.off()