# set working directory 
setwd("C:/Users/GB/Documents/Github/ExData_Plotting1/Scripts")

# make sure the plots folder exists
if (!file.exists('plots')) {
  dir.create('plots')
}

# load data
source("ETL.R")

# open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# plot data
hist(power.consumption$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()