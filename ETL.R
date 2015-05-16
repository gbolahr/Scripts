# setwd 
setwd("C:/Users/GB/Documents/Github/ExData_Plotting1/Scripts")

# required packages

library(lubridate)

# make sure the sources data folder exists
if (!file.exists('UCIdata')) {
  dir.create('UCIdata')
}

# check  if  data set exists, if not, create...
if (!file.exists('UCIdata/power_consumption.txt')) {
  
  # download the zip file and unzip
  file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(file.url,destfile='UCIdata/power_consumption.zip')
  unzip('UCIdata/power_consumption.zip',exdir='UCIdata',overwrite=TRUE)
  
  # read table and limit to 2 days
  variable.class<-c(rep('character',2),rep('numeric',7))
  power.consumption<-read.table('UCIdata/household_power_consumption.txt',header=TRUE,
                                sep=';',na.strings='?',colClasses=variable.class)
  power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
  
  # clean up the variable names and convert date/time fields
  cols<-c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity',
          'Sub_metering_1','Sub_metering_2','Sub_metering_3')
  colnames(power.consumption)<-cols
  power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
  power.consumption<-power.consumption[,c(10,3:9)]
  
  # write a clean data set to the directory
  write.table(power.consumption,file='UCIdata/power_consumption.txt',sep='|',row.names=FALSE)
} else {
  
  power.consumption<-read.table('UCIdata/power_consumption.txt',header=TRUE,sep='|')
  power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
  
}

# remove the large raw data set 
if (file.exists('UCIdata/household_power_consumption.txt')) {
  x<-file.remove('UCIdata/household_power_consumption.txt')
}