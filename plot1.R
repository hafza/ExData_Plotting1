#Load the data
data <-read.table("../household_power_consumption.txt",
                  header=TRUE, na.string="?", sep=";")

#Subset for 1/2/2007 and 2/2/2007
sample <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#Create time variable
sample$tstamp <-paste(sample$Date,sample$Time)
sample$date2 <-strptime(sample$tstamp,"%d/%m/%Y %H:%M:%S")

#Plot histogram
png("./plot1.png", height=480, width=480, units="px")
hist(sample$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()

