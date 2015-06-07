#** The source file should be in your working directory **#

# Read the data into data frame. The data we want starts from 66638th row
# to 69517th row. We use skip and nrows to read only the required rows
power_consumption=read.table("household_power_consumption.txt"
                             ,header = TRUE
                             ,sep = ";"
                             ,skip=66637
                             ,nrows=2879 
                             ,na.strings = "?",
                             colClasses = c(rep("character",2),rep("numeric",7)))

# Name the columns
names(power_consumption)  <- c("PDate","PTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Set the height and width of the device
png(file = "plot4.png", width = 480, height = 480)

# Set the parameters for the plot
par(mfrow = c(2, 2))
with(power_consumption,{   
  plot(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),
       Global_active_power,
       type='l',
       xlab = "",
       ylab ="Global Active Power")
  
  plot(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),
       Voltage,
       type='l',
       xlab = "datetime",
       ylab ="Voltage")
  
  plot(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),
       Sub_metering_1,
       type="l",
       xlab = "",
       ylab ="Energy sub metering",
       col = "black")
  
  lines(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),Sub_metering_2,col="red")
  lines(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),Sub_metering_3,col="blue")
  legend("topright",
         names(power_consumption)[7:9],
         lty =1, 
         bty ="n",
         col = c("black","red","blue"))

  plot(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),
       Global_reactive_power,
       type='l',
       xlab = "datetime",
       ylab ="Global_reactive_power")
})

# Close the device
dev.off()
