power <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
powerdata <-rbind(power[power$Date=="1/2/2007",],power[power$Date=="2/2/2007",])

powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
powerdata<-cbind(powerdata, "DateTime" = as.POSIXct(paste(powerdata$Date, powerdata$Time)))

with(powerdata, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(powerdata$Sub_metering_2 ~ powerdata$DateTime, col = 'Red')
lines(powerdata$Sub_metering_3 ~ powerdata$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))