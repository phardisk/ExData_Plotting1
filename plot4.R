file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.character(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%Y-%m-%d %H:%M:%S"
png(file = "plot4.png", bg = "white")
par (mfrow=c(2,2))

plot(r,prj[,3], type="l", ylab="Global Active Power",xlab="")

plot(r,prj[,5],type="l", ylab="Voltage",xlab="datetime")

plot(r, prj[,7], type='l',ylim=c(0,38),ylab="Energy sub metering",xlab="")
lines(r,prj[,9],col="blue")
lines(r,prj[,8],col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"),bty="n")

plot(r,prj[,4],type="l", ylab="Global_reactive_power",xlab="datetime")
dev.off()