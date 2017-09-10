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
#now we have to check pollution only for Baltimore so I will subset the data 
summary2<-subset(summary,summary$fips==24510)
#Doing same thing as I did for Q1
ag2<-aggregate(summary2$Emissions,by=list(summary2$year),sum)
ag2
#making histogram plot
barplot(ag2$x,names.arg=ag2$Group.1,xlab = "Year",ylab = "Emission",main = "Pollutin in Baltimore ")
#Png file
png(file="plot2.png")
barplot(ag2$x,names.arg=ag2$Group.1,xlab = "Year",ylab = "Emission",main = "Pollutin in Baltimore ")
dev.off()