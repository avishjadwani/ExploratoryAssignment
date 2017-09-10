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
#Now we have to find the pollution due to coalcombustion in US
#For this we have to filter out the data
#NOw filtering out the data related to coal combustion . Looking for coal in short name
summarycoal<-SCC[grepl("coal", SCC$Short.Name),]
#Creating a data frame with year,emussion only for coal data
mergedsummary<-merge(summary,summarycoal,by="SCC")
mergedsummary
#Now taking aggregate of emission
ag4<-aggregate(mergedsummary$Emissions,by=list(mergedsummary$year),sum)
ag4
#Plotting
barplot(ag4$x,names.arg = ag4$Group.1,xlab = "Year",ylab = "Emission",main = "Coal Combustion Emission")
#Image
png(file="plot4.png")
#creating plot
barplot(ag4$x,names.arg = ag4$Group.1,xlab = "Year",ylab = "Emission",main = "Coal Combustion Emission")
#closing device
dev.off()