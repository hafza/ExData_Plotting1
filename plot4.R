data <-read.table("../household_power_consumption.txt",
                  header=TRUE, na.string="?", sep=";")

#Subset for 1/2/2007 and 2/2/2007
sample <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#Create time variable
sample$tstamp <-paste(sample$Date,sample$Time)
sample$date2 <-strptime(sample$tstamp,"%d/%m/%Y %H:%M:%S")

#Compose multiple plots
png("./plot4.png", height=480, width=480, units="px")
par(mfcol=c(2,2))

#P-----lot Global Active Power graph
plot(sample$date2, sample$Global_active_power,
      type="l",lwd=2, ylab="Global active power",
      xlab="")

#-----Plot Sub-metering graphs
plot(sample$date2, sample$Sub_metering_1,
                type="l", lwd=2,
                ylab="Energy sub metering",
                xlab="")
lines(sample$date2, sample$Sub_metering_2,
          type="l", col="red")
lines(sample$date2, sample$Sub_metering_3,
          type="l", col="blue")
#place legend
legend("topright", lty=1, col=c("black", "red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"))
#-----Plot Voltage
plot(sample$date2, sample$Voltage,
      type="l", lwd=2, xlab="datetime",ylab="Voltage")

#-----Plot for Global_reactive_power
plot(sample$date2, sample$Global_reactive_power,
      type="l", lwd=2, ylab="Global_reactive_power",
      xlab="datetime")
dev.off()
