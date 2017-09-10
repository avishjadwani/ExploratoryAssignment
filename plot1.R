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
#We need to calculate emission in air every year 
#With help from online resources I found aggregate function 
?aggregate
#Help page aggregate(x, by, FUN, ..., simplify = TRUE, drop = TRUE
ag1<-aggregate(summary$Emissions,by=list(summary$year),sum)
ag1
# Group.1       x
#1    1999 7332967
#2    2002 5635780
#3    2005 5454703
#4    2008 3464206
#now we will make a plot of emission vs year using ag1
#I feel histogram will be a good graph to represent emission each year
?hist
#hist(x, breaks = "Sturges",...)
#hist takes one vector of values ie.x
#I will try using barplot
?barplot
#barplot(height, width = 1, space = NULL,names.arg=NULL,...)
barplot(ag1$x,names.arg = ag1$Group.1,main = "Yearwise Emission plot",xlab = "Year",ylab = "Emission")
#From the graph I can say, yes, the total emission have decreased year by year
#Now I will save this plot as a png file
#opening graphic device
png(file="plot1.png")
#plotting
barplot(ag1$x,names.arg = ag1$Group.1,main = "Yearwise Emission plot",xlab = "Year",ylab = "Emission")
#Closing graphic device
dev.off()