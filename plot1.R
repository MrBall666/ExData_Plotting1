#setwd('D:\\R\\coursera\\JHU Course\\Exploratory Data Analysis\\Assignment 1')
#Introduce the data
df<-read.table(file='household_power_consumption.txt',header=TRUE,sep=';')
#Retrieve the part of data we gonna use
df1<-subset(df,Date=='1/2/2007'|Date=='2/2/2007')
row.names(df1)<-c(for (i in seq_along(row.names(df1))){i})
#The variable 'Global_active_power' is character type, so we change it to numeric
df1$Global_active_power<-as.numeric(df1$Global_active_power)
#plot 1
png("plot1.png")
hist(df1$Global_active_power,xlab='Global Active Power (kilowatts)',main = 'Global Active Power',col = 'Red')
dev.off()