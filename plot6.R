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
#Similarily for California
Calsummary<-subset(summary,summary$fips=="06037")
Calsummaryroad<-subset(Calsummary,Calsummary$type=="ON-ROAD")
ag6<-aggregate(Calsummaryroad$Emissions,by=list(Calsummaryroad$year),sum)
ag6
#Making plot histogram
library(ggplot2)
#merging data as we will use facets
ag5$Country<-"Baltimore"
colnames(ag5)<-c("Year","Emission")
colnames(ag6)<-c("Year","Emission")
ag6$Country<-"California"
finalplot<-rbind(ag5,ag6)
plot<-ggplot(finalplot,aes(Year,Emission),fill=Country)+geom_bar(stat="identity")+facet_grid(.~Country)
#Baltimore has seena a significant decrease in the motor pollution level whereas California
#has seen increase in pollution level till 2005 after which it has decreased and is close to the 1999 levels
#Image
png(file="plot6.png")
plot
dev.off()
