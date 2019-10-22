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
 
 # jpeg(filename = "../Data_Course_Money/Exams/Exam_2/ Money_exam2_plot1.jpeg")
 
 ggplot(newsalaries, aes(y=newsalaries$Salaries, x=newsalaries$Tier, fill = newsalaries$Rank)) + geom_boxplot() +
   theme_bw() +
   labs(title = "Faculty salaries - 1995",
        subtitle = "",
        x = "Tier",
        y= "Salry",
        fill = "Rank")
 ggsave("../Data_Course_Money/Exams/Exam_2/Money_Exam2_plot1.jpg")
 
 
 # dev.off()
 
 
 
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
 mean(abs(residuals(mod1)))
 
 mean(abs(residuals(mod2)))
 
 mean(abs(residuals(mod3)))
 
 
 mean(residuals(mod1)^2)
 mean(residuals(mod2)^2)
 mean(residuals(mod3)^2)#### the one with the smallest mean squared

 plot(mod1)
 plot(mod2)
 plot(mod3)
 
# 4.  Use all your models to predict Diversity values in the data set (10 points)
 
 
 library(modelr)
 preds1 <- add_predictions(atmosphere,mod1)
 preds2 <-add_predictions(atmosphere,mod2)
 preds <-add_predictions(atmosphere,mod3)
 
 
 
 
 
#  5.  Make a plot showing actual Diversity values, along with the three models' predicted Diversity values.
#     Use color or some other aesthetic to differentiate the actual values and all three predictions (20 points)
# 	Hint: gather_predictions()   ...wait, what is this magical function!? Maybe this hint should be for #4 ???
 
 
 
 
atmos<- atmosphere %>%
   gather_predictions(mod1, mod2, mod3)


ggplot(atmos, aes(x=Aerosol_Density,y=Diversity,color=model)) +
  geom_point() +
  geom_point(aes(y=pred),color="Red") +
  facet_wrap(~model)

#mod1
{plot(atmosphere$Diversity ~ atmosphere$Aerosol_Density)
  points(x=atmos$Aerosol_Density  , y= atmos$pred, col="Red")
  abline(mod1)
   }

#mod2

{plot(atmosphere$Diversity ~ atmosphere$CO2_Concentration)
  points(x=atmos$CO2_Concentration  , y= atmos$pred, col="Red")
  abline(mod2)
}
#mod3

{plot(atmosphere$Diversity ~ atmosphere$Precip)
  points(x=atmos$Precip  , y= atmos$pred, col="Red")
  abline(mod3)
}


# 6.  Write code to show the predicted values of Diversity for each model using the hypothetical new data 
# found in hyp_data.csv (10 points)
df2<-read.csv("../Data_Course/Exam_2/hyp_data.csv")

summary(df2)

predict(mod1,newdata = df2)
predict(mod2, newdata = df2)
predict(mod3, newdata = df2)




library(caret)

# 
# 
# 
# 7.  Export a text file that contains the summary output from *both* your models to "model_summaries.txt" (10 points)
# (Hint: use the sink() function)



sink("../Data_Course_Money/Exams/Exam_2/model_summaries.txt")
summary(mod1)
summary(mod2)
summary(mod3)
sink(NULL)  # returns output to the console

getwd()


 
 
 #9.
 library(caret)
trainingsamples <- caret::createDataPartition(atmosphere$Diversity, .5)
trainingsamples = unlist(trainingsamples)
train = atmosphere[trainingsamples,]
test = atmosphere[-trainingsamples,]

bestmod = lm(formula = Diversity ~ Precip * Year, data = train)

best_preds = add_predictions(test, bestmod)

ggplot(best_preds, aes(x=Precip)) +
  geom_point(aes(y=Diversity), color = "Black") +
  geom_point(aes(y=pred), color = "Red", size = 4)
 
 
 
 
 
 