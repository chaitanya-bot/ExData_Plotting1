data<-read.csv("household_power_consumption.txt",sep=';')  ##read the file using ; as the separator
library(dplyr) 
data1<-filter(data,Date=="1/2/2007" | Date=="2/2/2007") ##filter the date 
data1$Date<-as.Date(data1$Date,format = "%d/%m/%Y") ##change the class to date
datetime <- paste(data1$Date, data1$Time)
data1$Datetime <- as.POSIXct(datetime) ##to merge date and time
par(mfrow=c(2,2),mar=c(4,4,1,1))  ## 4 plots with margin
with(data1, plot(Global_active_power~Datetime, type="l",ylab="Global Active Power", xlab=""))
with(data1, plot(Voltage, type="l",ylab="Voltage", xlab="datetime"))
with(data1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub meeting", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,cex=0.5,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
with(data1, plot(Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime"))  ##all 4 plots added
dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()

