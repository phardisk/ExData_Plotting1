file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.numeric(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%d-%m-%Y %H:%M:%S")
png(file = "plot1.png", bg = "transparent")
hist(prj[,3],xaxt="n",col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power (kilowatts)")
axis(1, at=c(0,1000,2000,3000), labels=c(0,2,4,6))
dev.off()