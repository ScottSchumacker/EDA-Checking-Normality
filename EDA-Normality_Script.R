# Scott Schumacker
# Exploratory Data Analysis - Checking for Normality

# Loading packages
library(tidyverse)
library(dplyr)
library(car)

# Exploring what data sets to use
data()

# Loading data
myData <- ToothGrowth

# View data and look at the structure of the data set
View(myData)
str(myData) # This step is to make sure that our variables are the right class

# Visualizing the distribution
# qq plot with car package
qqPlot(myData$len)

# qq plot with Stats package
qqnorm(myData$len, pch = 1, frame = FALSE)
qqline(myData$len, col = "red", lwd = 2)
# Ideally our data points should be as close to the qq line as possible

# Histogram and density plot with ggplot
ggplot(myData, aes(x=len)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 

# Shapiro-Wilke Test for normality
# Ho: The data follows a normal distribution
# Ha: The data does not follow a normal distribution
shapiro.test(myData$len)

# Since the p-value is larger than 0.05, we cannot reject the null hypothesis
# We can then assume we confidence that our data follows a normal distribution