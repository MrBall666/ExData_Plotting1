#setwd('D:\\R\\coursera\\JHU Course\\Exploratory Data Analysis\\Assignment 1')
#Introduce the data
df<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';')
#Retrieve the part of data we gonna use
df1<-subset(df,Date=='1/2/2007'|Date=='2/2/2007')
row.names(df1)<-c(for (i in seq_along(row.names(df1))){i})
#Change the date and time variables to formal formats
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
df1$Time <- strptime(df1$Time, format="%H:%M:%S")
df1[1:1440,"Time"] <- format(df1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df1[1441:2880,"Time"] <- format(df1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#Change the variables to numeric
df1$Global_active_power<-as.numeric(df1$Global_active_power)
df1$Sub_metering_1<-as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2<-as.numeric(df1$Sub_metering_2)
df1$Sub_metering_3<-as.numeric(df1$Sub_metering_3)
png("plot3.png")
plot(df1$Time,df1$Sub_metering_1,type='l',xlab=NA,ylab='Energy sub metering')
with(df1,lines(Time,Sub_metering_2,col='Red'))
with(df1,lines(Time,Sub_metering_3,col='Blue'))
legend("topright",lty=1,col=c('Black','Red','Blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
dev.off()
