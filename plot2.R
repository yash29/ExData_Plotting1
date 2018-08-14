library("data.table")
?fread
dat<-fread("household_power_consumption.txt",stringsAsFactors = FALSE)
names(dat)
head(dat)
sdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

# Plot the graph
?strptime
Date_Time <- strptime(paste(sdat$Date, sdat$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(Date_Time,as.numeric(sdat$Global_active_power),
     type = "l",
     xlab = " ",
     ylab = "Global Active Power(kilowatts)")
dev.off()
