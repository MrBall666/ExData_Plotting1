#setwd('D:\\R\\coursera\\JHU Course\\Exploratory Data Analysis\\Assignment 1')
#Introduce the data
df<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';')
#Retrieve the part of data we gonna use
df1<-subset(df,Date=='1/2/2007'|Date=='2/2/2007')
row.names(df1)<-c(for (i in seq_along(row.names(df1))){i})
#The variable 'Global_active_power' is character type, so we change it to numeric
df1$Global_active_power<-as.numeric(df1$Global_active_power)
#plot 2
df1$Date <- as.Date(df1$Date, format="%d/%m/%Y")
df1$Time <- strptime(df1$Time, format="%H:%M:%S")
df1[1:1440,"Time"] <- format(df1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df1[1441:2880,"Time"] <- format(df1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
png("plot2.png")
plot(df1$Time,df1$Global_active_power,type='l',xlab=NA,ylab='Global Active Power (kilowatts)')
dev.off()