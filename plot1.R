plot1 <-function() {
  
  

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
  
  
  data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
 
 
 #------- 
 #Plot 1
 #--------
 
 
#HISTOGRAM
par(mar=c(4,4,0.8,0.5))
hist(data2$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="tomato")
 
#Save PNG file
png(paste(path.report,"plot1.png", sep=""), width=480, height=480);
par(mar=c(4,4,0.8,0.5))
hist(data2$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="tomato")

dev.off()


}