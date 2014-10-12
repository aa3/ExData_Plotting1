all<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075260, 
                 header=TRUE, quote= "", strip.white=TRUE, 
                 stringsAsFactors = FALSE, na.strings= "?")
work<- subset(all, (all$Date == "1/2/2007" | all$Date== "2/2/2007"))
work$Date <- as.Date(work$Date, format = "%d/%m/%Y")
png("plot1.png", width = 480, height = 480)
hist(work$Global_active_power, type="l", main="Global Active Power",col='red',
     ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
