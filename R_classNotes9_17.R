
library(tidyverse)
####subset practice
data("iris")

data("MplsStops")
####find all species named setosa under the column of species
iris[iris$Species == "setosa",]
####find more than one 
iris[iris$Species == c("setosa", "virginica"), ]

#average petal length of setosa
setosamean <- mean(iris[iris$Species == 'setosa', "Petal.Length"])

#subset iris to petal length > 5
iris[iris$Petal.Length >5,]

#iris sepal length is between 5 - 6
iris[iris$Sepal.Length >= 5 & iris$Sepal.Length <=6 & iris$Species == 'virginica' ]

iris[iris$Sepal.Length >= 5]

#omit NA
sum(na.omit(MplsStops$gender))