#I. 	
#Once you get the file loaded into an R object as a data frame, feel free to do some 
#exploratory visualizations or summaries to get a feel for the data if you like.
#Your first task, though, is to create separate histograms of the DNA concentrations 
#for Katy and Ben. Make sure to add nice labels to these (x-axis and main title).

dna<-read.csv("../Exam_1/DNA_Conc_by_Extraction_Date.csv")

names(dna)

class(dna$Year_Collected) #data.frame = needs to be numeric
class(dna$Extract.Code)
class(dna$Date_Collected)
class(dna$DNA_Concentration_Katy)
class(dna$Lab)


library(dplyr)
dna2 <- mutate_all(dna$, function(x) as.numeric(as.character(x)))
dna2 <- as.numeric(dna)
dna2<-dna %>%
  mutate_all(as.numeric)
class(dna2)


#histograms of DNA concentrations (add labels)


hist(dna$DNA_Concentration_Katy,x=dna$Year_Collected, xlab = "Year Collected", 
     ylab = "Concentrations", main = "Histogram for DNA Concentration", breaks = 6, col = "blue")

hist(dna$DNA_Concentration_Ben,x=dna$Year_Collected, xlab = "Year Collected", 
     ylab = "Concentrations", main = "Histogram for DNA Concentration", breaks = 7, col = "green")

#plot(x=dna$DNA_Concentration_Katy, y=dna$Year_Collected)


#hist(dna, x=dna$Year_Collected, y=dna$DNA_Concentration_Katy)
#hist(dna,x=dna$DNA_Concentration_Katy)

#hist(dna2, 
    # main="Histogram for DNA Concentration", 
  #   xlab="Concentrations", 
   #  border="blue", 
    # col="green",
     #breaks = 6)


#II. 	
#Your second task is to look at DNA concentrations from the different extraction years. 
#One way to do this is a separate figure for each student is demonstrated in 
#those two files:	ZAHN_Plot1.jpeg and ZAHN_Plot2.jpeg 
#Open those files in some image viewing program and take a look. 
#I'd like you to re-create these exactly, including the labels.
#This is tricky, so I'll give a hint: the plot() function behaves differently 
#depending on the classes of vectors that are given to it.

#Ben boxplot

#Katy boxplot
summary(katy)
names(dna)
#boxplot(dna~dna$Year_Collected,xlab="Katy", ylab="Year")
?boxplot
boxplot(dna,data=dna,x=dna$DNA_Concentration_Katy, y=dna$Year_Collected, xlab="Year", ylab ="Concentration")
dna$DNA_Concentration_Katy
#year<-dna[dna$Year_Collected,]
#dna[dna$DNA_Concentration_Katy,]
    
#dna[dna$Extract.Code,]
#dna[dna$Date_Collected,]


#IV.
#Take a look at Ben's concentrations vs Katy's concentrations. You can do this however you 
#like... with a plot or with summary stats or both.
#It looks like Ben had consistently higher DNA yields than Katy did...but surely it wasn't
#uniformly better, right? With some samples, he only had a marginal improvement over Katy.
#With other samples, he had a relatively massive improvement over her.
#Your task here is to write some code that tells us: in which extraction YEAR, 
#was Ben's performance the lowest RELATIVE TO Katy's performance?

summary(ben)
summary(katy)
dna$DNA_Concentration_Ben

min(dna$DNA_Concentration_Ben)
min(dna$DNA_Concentration_Katy)



#V.
#Do another subset of the data for me. 
#Subset the data frame so it's just the "Downstairs" lab.
#Now, make a scatterplot of the downstairs lab data such that "Date_Collected" 
#is on the x-axis and "DNA_Concentration_Ben" is on the y-axis. 
#Save this scatterplot as "Ben_DNA_over_time.jpg" in your Exam_1 directory. 
#See the file "Downstairs.jpg" for an example of how yours should look. 
#If it looks different, you might need to do some class conversions so the plot() 
#function treats things correctly. HintHintHint: POSIXct
jpeg()
plot(x=downstair$Date_Collected, y=downstair$DNA_Concentration_Ben, 
     main="Ben DNA over time",xlab="Date",ylab="Concentration")

#which(rowSums(dna$DNA_Concentration_Ben) == max(rowSums(dna$DNA_Concentration_Ben)))


dateforben <- 
downstair$Date_Collected

downstair<-dna[dna$Lab == "Downstairs",]

jpeg("../Data_Course_Money/Exam_1/Ben_DNA_over_time.jpg")
plot(x=downstair$Date_Collected, y=downstair$DNA_Concentration_Ben, main="Ben DNA over time",xlab="Date",ylab="Concentration")
dev.off

