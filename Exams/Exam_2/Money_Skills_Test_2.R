library(tidyr)


# I. 	Simple tidying exercise
# 
# 1.  Read in salaries.csv (needs some tidying)
# This is faculty salary information from 1995 - Split up by university, state, faculty rank, and university tier
# Faculty "Rank" progresses from "AssistProf" to "AssocProf" to "FullProf"


salaries <- read.csv(file="../../Desktop/Data_Course_Money/Exams/Exam_2/salaries.csv", header=TRUE, sep=",")
salaries
#change 3 types of professor salaries to one column of salaries and one column of professor level.

#Insert new column called Salary


newsalaries<-gather(salaries, "Rank", "Salaries", 5:7)


# 
# 2.  Convert to a usable tidy format so we can look at "Salary" as a dependent variable (10 points)
# 
# 3.  Using ggplot, create boxplot of salary (y-axis) by University Tier (x-axis), filled by Faculty Rank (10 points)
# x-axis = Tier
# y-axis = Salary
# Boxplot fill color = Rank
# Title = "Faculty Salaries - 1995"
# 
# 4.  Export this delightful boxplot to a file named "LASTNAME_exam2_plot1.jpeg" (10 points)
