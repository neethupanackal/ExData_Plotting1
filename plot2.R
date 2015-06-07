#######################################
# the source file should be in your working directory 
#
#
########################################


##/*c(66638:69517)*/##
power_consumption=read.table("household_power_consumption.txt",header = TRUE, sep = ";",skip=66637,nrows=2879 , na.strings = "?",
                             colClasses = c(rep("character",2),rep("numeric",7)))
names(power_consumption)  <- c("PDate","PTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


png(file = "plot2.png", width = 480, height = 480)
plot(
  strptime(paste(power_consumption$PDate,power_consumption$PTime),format="%d/%m/%Y %T"),
  power_consumption$Global_active_power,
  type='l',
  xlab = "",
  ylab ="Global Active Power (kilowatts)" 
  )
dev.off()
