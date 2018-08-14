library("data.table")
?fread
dat<-fread("household_power_consumption.txt",stringsAsFactors = FALSE)
names(dat)
head(dat)
sdat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
head(sdat)

# Plot for Global Active Power
png("plot1.png",width = 480,height = 480)
hist(as.numeric(sdat$Global_active_power),col="red",
     main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")
dev.off()
