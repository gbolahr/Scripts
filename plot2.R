# set working directory 
setwd("C:/Users/GB/Documents/Github/ExData_Plotting1/Scripts")

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source("ETL.R")

# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(power.consumption$DateTime,power.consumption$Global_active_power,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()