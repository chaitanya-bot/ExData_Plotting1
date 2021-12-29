data<-read.csv("household_power_consumption.txt",sep=';')  ##read the file using ; as the separator
library(dplyr) 
data1<-filter(data,Date=="1/2/2007" | Date=="2/2/2007") ##filter the date 
data1$Date<-as.Date(data1$Date,format = "%d/%m/%Y") ##change the class to date
datetime <- paste(data1$Date, data1$Time)
data1$Datetime <- as.POSIXct(datetime) ##to merge date and time
with(data1, plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()