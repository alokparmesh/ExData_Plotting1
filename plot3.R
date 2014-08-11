download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="assign1.zip")
unzip("assign1.zip") 
dat<- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat2 <- dat[dat$Date >= as.Date('2007-02-01') & dat$Date <= as.Date('2007-02-02'),]
dat2$datetime <- as.POSIXct(paste(dat2$Date, dat2$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png",width = 480, height = 480, units = "px")
with(dat2,plot(datetime,Sub_metering_1, type="l",xlab="", ylab="Energy sub metering"))
with(dat2,points(datetime,Sub_metering_2, type="l", col="red"))
with(dat2,points(datetime,Sub_metering_3, type="l", col="blue"))
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'))
dev.off()