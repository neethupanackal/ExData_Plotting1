#######################################
# the source file should be in your working directory 
#
#
########################################



power_consumption=read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip=66637,nrows=2879 , na.strings = "?",
                             colClasses = c(rep("character",2),rep("numeric",7)))
names(power_consumption)  <- c("PDate","PTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")



png(file = "plot3.png", width = 480, height = 480)
with(power_consumption, 
      plot(
        strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),
       Sub_metering_1,
       type="l",
       xlab = "",
       ylab ="Energy sub metering",
       col = "black"
      )
 )  

with(power_consumption,
     lines(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),Sub_metering_2,col="red")
)

with(power_consumption,
     lines(strptime(paste(PDate,PTime),format="%d/%m/%Y %T"),Sub_metering_3,col="blue")
)

legend("topright",names(power_consumption)[7:9] , lty =1, col = c("black","red","blue"))
dev.off()
