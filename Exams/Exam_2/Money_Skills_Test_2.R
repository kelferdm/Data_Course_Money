library(tidyr)
library(ggplot2)

# I. 	Simple tidying exercise
# 
# 1.  Read in salaries.csv (needs some tidying)
# This is faculty salary information from 1995 - Split up by university, state, faculty rank, and university tier
# Faculty "Rank" progresses from "AssistProf" to "AssocProf" to "FullProf"
#2.  Convert to a usable tidy format so we can look at "Salary" as a dependent variable (10 points)

salaries <- read.csv(file="../../Desktop/Data_Course_Money/Exams/Exam_2/salaries.csv", header=TRUE, sep=",")
salaries

#change 3 types of professor salaries to one column of salaries and one column of professor level.
#Insert new column called Salary/Rank

newsalaries<-gather(salaries, "Rank", "Salaries", 5:7)


# 
# 3.  Using ggplot, create boxplot of salary (y-axis) by University Tier (x-axis), filled by Faculty Rank (10 points)

# x-axis = Tier
# y-axis = Salary
# Boxplot fill color = Rank
# Title = "Faculty Salaries - 1995"

ggplot(newsalaries, aes(y=newsalaries$Salaries, x=newsalaries$Tier, fill = newsalaries$Rank)) + geom_boxplot() +
  theme_bw() +
  labs(title = "Faculty salaries - 1995",
       subtitle = "",
       x = "Tier",
       y= "Salry",
       fill = "Rank")
  
  
  
  #just checking salary numbers
 max(newsalaries$Salaries, na.rm = TRUE)

 
# 
# 4.  Export this delightful boxplot to a file named "LASTNAME_exam2_plot1.jpeg" (10 points)
 
 jpeg(filename = "../Data_Course_Money/Exams/Exam_2/ Money_exam2_plot1.jpeg")
 
 ggplot(newsalaries, aes(y=newsalaries$Salaries, x=newsalaries$Tier, fill = newsalaries$Rank)) + geom_boxplot() +
   theme_bw() +
   labs(title = "Faculty salaries - 1995",
        subtitle = "",
        x = "Tier",
        y= "Salry",
        fill = "Rank")
 
 dev.off()
 
 
 
 ###Part 2 ####
 
 ##1.  Read in atmosphere.csv (pretty clean data set)
 
  atmosphere <- read.csv(file="../../Desktop/Data_Course_Money/Exams/Exam_2/atmosphere.csv", header=TRUE, sep=",")

 atmosphere
 
 # 2.  Create three different linear models with Diversity as the dependent variable (Diversity as a function of...
 ### (the dependent variable is set up first). 
 #The three models should have different
 #predictors, or at least different numbers of predictors, with or without interaction terms. (10 points) 
 mod1 <- lm(Diversity~Aerosol_Density, data = atmosphere)
 
 mod2 <- lm(Diversity ~ CO2_Concentration, data = atmosphere)
 
 mod3 <- lm(Diversity ~ Precip, data = atmosphere)
 
 
 #3.  Compare the residuals of the three models and somehow document 
 #which has best explanatory power for the data (10 points)
 
 residuals(mod1)
 mean(residuals(mod1)^2)
 mean(residuals(mod2)^2)
 mean(residuals(mod3)^2)#### the one with the smallest mean squared

 plot(mod1)
 plot(mod2)
 plot(mod3)
 
# 4.  Use all your models to predict Diversity values in the data set (10 points)
 
 
 