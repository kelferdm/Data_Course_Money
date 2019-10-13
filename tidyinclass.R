
##read in individual csv to dataframe
a<- read.csv("../Data_Course/Data/Messy_Take2/a_df.csv")
b<- read.csv("../Data_Course/Data/Messy_Take2/b_df.csv")
c<- read.csv("../Data_Course/Data/Messy_Take2/c_df.csv")
d<- read.csv("../Data_Course/Data/Messy_Take2/d_df.csv")
e<- read.csv("../Data_Course/Data/Messy_Take2/e_df.csv")
f<- read.csv("../Data_Course/Data/Messy_Take2/f_df.csv")
g<- read.csv("../Data_Course/Data/Messy_Take2/g_df.csv")

#bind all csv together
fs<-rbind(a,b,c,d,e,f,g)

 #need to tidy
#1. Put DOB_Male, DOB_Female into 1 column gather
#2. Insert new column called Sex fs$DOB <- c(DOB_Male,DOB_Female)
#3. Put DaysAlive_Male/DaysAlive_Female into 1 column fs$DaysAlive <- c(DaysAlive_Female,DaysAlive_Male)
#4. 


#give columns new column names to get rid of weird column names
newnames <- c("DOB_Male", "DaysAlive_Male","IQ_Male", "Pass_Male", "DOB_Female", 
              "DaysAlive_Female","IQ_Female", "Pass_Female")
names(fs) <- newnames
View(fs) 

##for loop to read in all new csv
##for(i in fs)
##{assign(x=basename(i), read.csv(i),envir=.GlobalEnv)}

library(dplyr)
library(tidyverse)


#put all _Female data into "female"
female <- fs %>%
  select(ends_with("_Female"))

male <- fs %>%
  select(ends_with("_Male"))

female
#add Gender column
female <- female %>% 
  mutate(Gender = "Female")


male
female

#need to remove all "_Female"  part of the column names
names(female) <- str_replace(names(female), "_Female", "")

names(male) <- str_replace(names(male), "_Male", "")
male

female

male <- male %>% 
  mutate(Gender = "Male")
male

#female <- female %>%
 # mutate(Gender = "Female")

#rename columns
names(male)
names(female)
####works
male<-str_replace(names(male),"_Male","")
#female<-str_replace(names(female),"_Female","")


male
female


###NOT WORKING
#bind 
 clean <- rbind(male,female)

 clean
 
#save clean data set to file
write.csv(clean,"./../Data_Course_Money/Data/MessyData/cleaned_data.csv",row.names = FALSE,quote=FALSE)

#save file in RDS smaller file - saves in compressed binary format
saveRDS(object = clean,file="../Data_Course_Money/Data/MessyData/cleaned_data.RDS")


####Starting point for new analysis####


##load packages
library(tidyverse)
library(ggplot2)
##load in cleaned data
df <- readRDS("../Data_Course_Money/Data/MessyData/cleaned_data.RDS")

#####intro to modeling####

names(fs)
ggplot(fs,aes(x=DaysAlive, y=IQ,color=Gender)) +
  geom_point() + geom_smooth(method = "lm")

ggplot(fs,aes(x-DOB,y=Pass)) +
  geom_point()

data(iris)

ggplot(iris,aes(x=Petal.Length, y= Sepal.Length)) +
  geom_point() + geom_smooth(method = "lm")

##sepal length is a function of petal length
mod1 <- lm(data = iris, Sepal.Length ~ Petal.Length)

mod1
summary(mod1)
sum(abs(residuals(mod1)))
residuals(mod1)^2
mean(residuals(mod1)^2)

#to find the interaction of all 3 you must use *
mod2<- lm(data=iris,Sepal.Length~Petal.Length * Species)
mod2
summary(mod2)

ggplot(iris,aes(x=Petal.Length, y= Sepal.Length)) +
  geom_point() + geom_smooth(method = "lm", aes(color = Species))+
  geom_smooth(method = "lm", color = "Black", linetype = 2)


#influence of petal length on sepal and the influene of species on sepal
mod3 <- lm(data = iris, Sepal.Length ~ Petal.Length + Species)
mod3
summary(mod3)

residuals(mod1)
mean(residuals(mod1)^2)
mean(residuals(mod2)^2)
mean(residuals(mod3)^2)

library(modelr)
add_predictions(iris,mod1)







