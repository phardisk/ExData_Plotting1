file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.character(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%Y-%m-%d %H:%M:%S"
png(file = "plot3.png", bg = "white")
plot(r, prj[,7], type='l',ylim=c(0,38),ylab="Energy sub metering",xlab="")
lines(r,prj[,9],col="blue")
lines(r,prj[,8],col="red")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"))
dev.off()