
plot(power$completeDate, power$Sub_metering_1, type="n", ylab="Energy Sub Metering", xlab="")
lines(power$completeDate, power$Sub_metering_1, col="black")
lines(power$completeDate, power$Sub_metering_2, col="red")
lines(power$completeDate, power$Sub_metering_3, col="blue")
legend("topright",  lty=1, col=c("black", "blue", "red"), cex=0.7, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))