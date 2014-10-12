all<- read.table("./household_power_consumption.txt", sep=";",nrows= 2075260, 
                 header=TRUE, quote= "", strip.white=TRUE, 
                 stringsAsFactors = FALSE, na.strings= "?")
work<- subset(all, (all$Date == "1/2/2007" | all$Date== "2/2/2007"))
work$Date <- as.Date(work$Date, format = "%d/%m/%Y")
work$DateTime <- as.POSIXct(paste(work$Date, work$Time))
png("plot3.png", width = 480, height = 480)
plot(work$DateTime, work$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")
lines(work$DateTime, work$Sub_metering_2, type="l", col="red")
lines(work$DateTime, work$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()
