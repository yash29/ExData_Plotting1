library("data.table")
?fread
dat<-fread("household_power_consumption.txt",stringsAsFactors = FALSE)
names(dat)
head(dat)
sdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

# Plot the graph
?strptime
Date_Time <- strptime(paste(sdat$Date, sdat$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480,height = 480)
plot(Date_Time,sdat$Sub_metering_1,
     type='l',
     ylab="Energy Submetering")
lines(Date_Time, sdat$Sub_metering_2, type="l", col="red")
lines(Date_Time, sdat$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()
