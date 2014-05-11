file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.numeric(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%d-%m-%Y %H:%M:%S")
png(file = "plot4.png", bg = "transparent")
par (mfrow=c(2,2))

plot(r,prj[,3], yaxt = "n",type="l", ylab="Global Active Power",xlab="")
axis(2, at=c(0,1000,2000,3000), labels=c(0,2,4,6))

plot(r,prj[,5], yaxt = "n",type="l", ylab="Voltage",xlab="datetime")
axis(2, at=c(800,1000,1200,1400,1600,1800,2000), labels=c(234,"",238,"",242,"",246))

plot(r, prj[,7], type='l',ylim=c(0,35),ylab="Energy sub metering",xlab="")
lines(r,prj[,9],col="blue")
lines(r,prj[,8],col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"),bty="n")

plot(r,prj[,4], yaxt = "n",type="l", ylab="Global_reactive_power",xlab="datetime",ylim=c(0,250))
axis(2, at=c(0,50,100,150,200,250), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.off()