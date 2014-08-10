dataset <- read.csv("household_power_consumption.txt",sep=";")
dataset <- as.vector(dataset)

# I could have used strptime() and went ahead with it, but this works just as 
# fine
dataset <- dataset[dataset$Date == "1/2/2007" | dataset$Date == "2/2/2007",]
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')
hist(as.double(as.vector(dataset$Global_active_power)), xlab = "global active power (kilowatts)", main = "Global active power", col = "red")
dev.off()