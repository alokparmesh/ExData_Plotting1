download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="assign1.zip")
unzip("assign1.zip") 
dat<- read.table('household_power_consumption.txt',header=TRUE,sep=";",na.strings="?")
dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
dat2 <- dat[dat$Date >= as.Date('2007-02-01') & dat$Date <= as.Date('2007-02-02'),]
dat2$datetime <- as.POSIXct(paste(dat2$Date, dat2$Time), format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480, units = "px")
with(dat2,plot(datetime,Global_active_power , type="l",xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()



