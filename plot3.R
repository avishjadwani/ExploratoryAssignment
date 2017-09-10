#Starting with the exploratory data analysis assignment
#Checking working directory
getwd()
#[1] "C:/Users/Monika/Documents"
#Changing woriking directory to desired one
setwd("C:/Users/Monika/Desktop/exploratory course")
getwd()
#I have unziped the downloaded file NOw I will begin reading them
#Reading files
summary<-readRDS(file="summarySCC_PM25.rds")
SCC<-readRDS(file="Source_Classification_Code.rds")
#now we have to find emission from each type every year
#we have 4 types so we plot 4 graphs of emmision vs year
library(ggplot2)
#filtering the data for Baltimore 
summary3<-subset(summary,summary$fips==24510)
#Making a plot for all the types
g<-ggplot(summary3,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity")+facet_grid(.~type)+labs(x="Year")
#creating image
png(file="plot3.png")
#plot
g
# Device off
dev.off()