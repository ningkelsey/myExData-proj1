dt<-read.csv("~/r/household_power_consumption.txt",nrows=-1L,header=T, na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")
d1<- subset(dt, Date=="1/2/2007")
d2<- subset(dt, Date=="2/2/2007")
nd<-rbind(d1,d2)
x<-strptime(nd$Date,"%d/%m/%Y")
datetime<-paste(as.Date(x),nd$Time)
xx<-as.POSIXct(datetime)
par(new=T)
plot(nd$Sub_metering_1~xx,type="l",ylab="Energy Sub metering",xlab="")
lines(nd$Sub_metering_2~xx,type="l",ylab="Energy Sub metering",xlab="",col="red")
lines(nd$Sub_metering_3~xx,type="l",ylab="Energy Sub metering",xlab="",col="blue")
recordGraphics(legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'),cex=0.8),list(), getNamespace("graphics"))
dev.copy(png,filename="plot3.png",width = 480, height = 480, units = "px")
dev.off()