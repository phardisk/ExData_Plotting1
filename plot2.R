file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.character(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%Y-%m-%d %H:%M:%S"
png(file = "plot2.png", bg = "white")
plot(r,prj[,3],type="l", ylab="Global Active Power(kilowatts)",xlab="")
dev.off()