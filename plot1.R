power <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
powerdata <-rbind(power[power$Date=="1/2/2007",],power[power$Date=="2/2/2007",])

powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
powerdata<-cbind(powerdata, "DateTime" = as.POSIXct(paste(powerdata$Date, powerdata$Time)))

hist(as.numeric(powerdata$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")


  