plot2 <-function() {
  
  

    library(data.table);
  
    
    # ESTABLISH PATHS
   
path.data <- paste0(getwd(), "/course4/");
path.report <- paste0(getwd(), "/course4/");
   
    
    # Read data
  data <- as.data.table(read.table(paste0(path.data,"household_power_consumption.txt"),header=TRUE ,sep=";"))
  
  #data$Date <- gsub("/", "-", data$Date)
  
  d1 <-subset(data, Date=="1/2/2007")
  d2 <- subset(data, Date=="2/2/2007")
  
  data2 <- rbind(d1,d2)
  
#Transform Date in as.Date

data2 <- transform(data2, Date=as.Date(paste0(substr(data2$Date,5,8),"-", substr(data2$Date,3,3),"-", substr(data2$Date,1,1))), Time= format(strptime(data2$Time, "%H:%M:%OS"), "%H,%M,%S"))
  


#head(data2, c=4)
#data2$Global_active_power <- ts(data2[,3], start= as.Date("2007-02-01"), end=as.Date("2007-02-02"))

data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
 
 

#data2$Date <- weekdays(data2$Date, abbreviate=TRUE)


#------- 
 #Plot 2
#---------
 
 
#PLOT 
par(mar=c(2,4,0.8,0.5))
 with(data2,plot(Global_active_power, xaxt="n", main="", xlab="",ylab=" Global Active Power (kilowatts)", type="l"))
 mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)


#Save PNG file
png(paste(path.report,"plot2.png", sep=""), width=480, height=480);
par(mar=c(2,4,0.8,0.5))
with(data2,plot(Global_active_power, xaxt="n", main="", xlab="",ylab=" Global Active Power (kilowatts)", type="l"))
mtext(c("Thu","Fri", "Sat"), at=c(1,1440,2880), side=1, las=1, line=0.4,cex=0.85)

dev.off()


}