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
#Now here we have to use data only for Baltimore so we will filter it out
BalSummary<-subset(summary,summary$fips==24510)
#Now in the Baltimore data we want to see motor pollution so we use type = Road pollution only 
#So again filtering 
balsummroad<-subset(BalSummary,BalSummary$type=="ON-ROAD")
#NOw aggregating and making plot
ag5<-aggregate(balsummroad$Emissions,by=list(balsummroad$year),sum)
ag5
#Making plot histogram
barplot(ag5$x,ag5$Group.1,xlab = "year",ylab = "Emission",main = "Baltimore Motor Pollution")
#The motor pollution have decreased in Baltimore over the years
#Saving image
png(file="plot5.png")
#creating plot
barplot(ag5$x,ag5$Group.1,xlab = "year",ylab = "Emission",main = "Baltimore Motor Pollution")
#closing file
dev.off()