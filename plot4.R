# set working directory 
setwd("C:/Users/GB/Documents/Github/ExData_Plotting1/Scripts")

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source("ETL.R")

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(power.consumption$DateTime,power.consumption$Global_active_power,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(power.consumption$DateTime,power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$Sub_metering_1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$Sub_metering_2,col=lncol[2])
lines(power.consumption$DateTime,power.consumption$Sub_metering_3,col=lncol[3])

# plot data on bottom right (2,2)
plot(power.consumption$DateTime,power.consumption$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
x<-dev.off()