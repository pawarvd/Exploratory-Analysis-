power <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
powerdata <-rbind(power[power$Date=="1/2/2007",],power[power$Date=="2/2/2007",])

powerdata$Date <- as.Date(powerdata$Date,"%d/%m/%Y")
powerdata<-cbind(powerdata, "DateTime" = as.POSIXct(paste(powerdata$Date, powerdata$Time)))

par(mfrow=c(2,2))
plot(powerdatadata$Global_active_power ~ powerdata$DateTime, type="l")
plot(powerdata$Voltage ~ powerdata$DateTime, type="l")

with(powerdata, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(powerdata$Sub_metering_2 ~ powerdata$DateTime, col = 'Red')
lines(powerdata$Sub_metering_3 ~ powerdata$DateTime, col = 'Blue')

plot(powerdata$Global_reactive_power ~ powerdata$DateTime, type="l")