data<-read.csv("household_power_consumption.txt",sep=';')  ##read the file using ; as the separator
library(dplyr) 
data1<-filter(data,Date=="1/2/2007" | Date=="2/2/2007") ##filter the date 
data1$Date<-as.Date(data1$Date,format = "%d/%m/%Y") ##change the class to date
data1$Global_active_power<-as.numeric(data1$Global_active_power) ##convert to numeric from character
hist(data1$Global_active_power,main = "Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
