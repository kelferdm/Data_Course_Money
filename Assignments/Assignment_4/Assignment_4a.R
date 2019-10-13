df<-read.csv("../Data_Course/Data/landdata-states.csv")

##1.  Create a new R script as part of your Assignment 4 R-project. Name it "Assignment_4.R"
##2.  That script should do the following:
##  + Read in the file: "/Data/ITS_mapping.csv"   ...good luck with that, hahaha!
##  + Somehow summarize all of the columns and do a bit of additional exploration (play with some functions)
##+ Make a boxplot where "Ecosystem"" is on the x-axis and "Lat" is on the y-axis 


  ##  + Write code to export this boxplot to a new file in your Assignment_4 directory called "silly_boxplot.png"
##      Hints on below ...
##3.  Make sure to save your completed script and Rproject and make sure your png file is saved correctly
##4.  Push all these saved changes and new files onto your GitHub repository so I can grade them
##5.  Don't forget the plaintext file with answers to bolded questions needs to go to Canvas as well!   


#1
dfa<-read.csv("../Data_Course/Data/ITS_mapping.csv",stringsAsFactors = FALSE) #nope

dfb<-read.csv("../Data_Course/Data/ITS_mapping.csv") #nope

dfc<-read.csv2("../Data_Course/Data/ITS_mapping.csv") #nope

dfd <- read.csv("../Data_Course/Data/ITS_mapping.csv", stringsAsFactors = FALSE) #nope


dff <- read.delim("../Data_Course/Data/ITS_mapping.csv") ##yay!

summary(dff)
str(dff)

#summary(dfa)
#summary(dfb)
#summary(dfc)
#str(dfa)
#str(dfb)
#eeek

#boxplot
plot(x=dff$Ecosystem,y=dff$Lat)


png(filename = "../Data_Course_Money/Assignments/Assignment_4/silly_boxplot.png")
plot(x=dff$Ecosystem,y=dff$Lat)
dev.off()












