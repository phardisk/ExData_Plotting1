file<-read.table("power.txt",header=T,sep=";")
prj<-file[file$Date=="1/2/2007" | file$Date=="2/2/2007",]
prj[,1]<-as.Date(prj[,1],"%d/%m/%Y")
for (i in 3:8){
prj[,i]<-as.character(prj[,i])
}
dateTime<-paste(prj[,1],prj[,2])
r <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")

png(file = "plot1.png", bg = "white")
hist(as.numeric(prj[,3]),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power (kilowatts)")
dev.off()