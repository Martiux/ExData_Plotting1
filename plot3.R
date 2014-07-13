plot3 <-function() {
  
  

    library(data.table);
  
    
    # ESTABLISH PATHS
   
    path.data <- paste0(getwd(), "/course4/");
    path.report <- paste0(getwd(), "/course4/");
   
    
    # Read data
  data <- as.data.table(read.table(paste0(path.data,"household_power_consumption.txt"),header=TRUE ,sep=";"))
  
  
  
  d1 <-subset(data, Date=="1/2/2007")
  d2 <- subset(data, Date=="2/2/2007")
  
  data2 <- rbind(d1,d2)
  
  data2 <- transform(data2, Date=as.Date(paste0(substr(data2$Date,5,8),"-", substr(data2$Date,3,3),"-", substr(data2$Date,1,1))), Time= format(strptime(data2$Time, "%H:%M:%OS"), "%H,%M,%S"))
  
  
 
 data2$Sub_metering_1 <-as.numeric(as.character(data2$Sub_metering_1))
  data2$Sub_metering_2 <-as.numeric(as.character(data2$Sub_metering_2))
  data2$Sub_metering_3 <-as.numeric(as.character(data2$Sub_metering_3))
 
  #data2$Date <- strptime( paste(data2$Date), format="%d/%m/%Y")
  
 #------- 
 #Plot 3
 #---------
 
 
#PLOT 
par(mar=c(2,4,0.8,0.5))

with(data2,plot(Sub_metering_1, xaxt="n", main="", xlab="",ylab=" Energy sub metering", type="l"))
points(data2$Sub_metering_2, type="l", col="red")
points(data2$Sub_metering_3, type="l", col="blue")
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)

legend("topright",cex=0.8,legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"));


 
#Save PNG file
png(paste(path.report,"plot3.png", sep=""), width=480, height=480);
par(mar=c(2,4,0.8,0.5))

with(data2,plot(Sub_metering_1, xaxt="n", main="", xlab="",ylab=" Energy sub metering", type="l"))
points(data2$Sub_metering_3, type="l", col="blue")
points(data2$Sub_metering_2, type="l", col="red")
points(data2$Sub_metering_3, type="l", col="blue")
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)

legend("topright", cex=0.8,legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue" ));


dev.off()


}