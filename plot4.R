plot4 <-function() {
  
  

    library(data.table);
  
    
    # ESTABLISH PATHS
   
    path.data <- paste0(getwd(), "/course4/");
    path.report <- paste0(getwd(), "/course4/");
   
    
    # Read data
  data <- as.data.table(read.table(paste0(path.data,"household_power_consumption.txt"),header=TRUE ,sep=";"))
  
 
 #Subsetting
 
  d1 <-subset(data, Date=="1/2/2007")
  d2 <- subset(data, Date=="2/2/2007")
  
  data2 <- rbind(d1,d2)
  
  
 #numeric
  data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
 
  data2$Global_reactive_power <-as.numeric(as.character(data2$Global_reactive_power))
  data2$Voltage <-as.numeric(as.character(data2$Voltage))
  data2$Sub_metering_1 <-as.numeric(as.character(data2$Sub_metering_1))
  data2$Sub_metering_2 <-as.numeric(as.character(data2$Sub_metering_2))
  data2$Sub_metering_3 <-as.numeric(as.character(data2$Sub_metering_3))
  data2$Global_reactive_power <-as.numeric(as.character(data2$Global_reactive_power))

 #-------
 #Plot 4
 #---------
 
#PLOT 
par(mfrow=c(2,2), mar=c(4,4,0.8,0.5))
with(data2,plot(Global_active_power, xaxt="n", main="", xlab="",ylab=" Global Active Power (kilowatts)", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)


par(mar=c(4,4,0.8,0.5))
with(data2,plot(Voltage, xaxt="n", main="", xlab="",ylab=" Voltage", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)
mtext("datetime", side=1, line=1.5, cex=0.80)



par(mar=c(2,4,0.8,0.5))

with(data2,plot(Sub_metering_1, xaxt="n", main="", xlab="",ylab=" Energy sub metering", type="l"))
points(data2$Sub_metering_3, type="l", col="blue")
points(data2$Sub_metering_2, type="l", col="red")
points(data2$Sub_metering_3, type="l", col="blue")
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.75)

legend("topright",bty="n", cex=0.8,legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue" ));


par(mar=c(4,4,0.8,0.5))
with(data2,plot(Global_reactive_power, xaxt="n", main="", xlab="",ylab=" Global_reactive_power", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)
mtext("datetime", side=1, line=1.5, cex=0.80)


##-------------- 
#Save PNG file
png(paste(path.report,"plot4.png", sep=""), width=480, height=480);

par(mfrow=c(2,2), mar=c(4,4,0.8,0.5))
with(data2,plot(Global_active_power, xaxt="n", main="", xlab="",ylab=" Global Active Power (kilowatts)", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)


par(mar=c(4,4,0.8,0.5))
with(data2,plot(Voltage, xaxt="n", main="", xlab="",ylab=" Voltage", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)
mtext("datetime", side=1, line=1.5, cex=0.80)



par(mar=c(2,4,0.8,0.5))

with(data2,plot(Sub_metering_1, xaxt="n", main="", xlab="",ylab=" Energy sub metering", type="l"))
points(data2$Sub_metering_3, type="l", col="blue")
points(data2$Sub_metering_2, type="l", col="red")
points(data2$Sub_metering_3, type="l", col="blue")
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)

legend("topright",bty="n", cex=0.75,legend=c("Sub_metering_1" , "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red","blue" ));


par(mar=c(4,4,0.8,0.5))
with(data2,plot(Global_reactive_power, xaxt="n", main="", xlab="",ylab=" Global_reactive_power", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)
mtext("datetime", side=1, line=1.5, cex=0.80)


dev.off()


}