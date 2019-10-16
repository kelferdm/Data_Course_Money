data("mtcars")
library(knitr)
# Your task is to Write an R script that:

#1.  loads the mtcars data set
data("mtcars")
df <- mtcars

#2.  subsets the mtcars dataframe to include only **automatic transmissions**

kable(c("Column     Name      Description",
        "[, 1]	      mpg     	 Miles/(US) gallon",
        "[, 2]	      cyl     	 Number of cylinders",
        "[, 3]	      disp     	 Displacement (cu.in.)",
        "[, 4]	      hp     	 Gross horsepower",
        "[, 5]	      drat     	 Rear axle ratio",
        "[, 6]	      wt     	 Weight (1000 lbs)",
        "[, 7]	      qsec     	 1/4 mile time",
        "[, 8]	      vs     	 V/S",
        "[, 9]	      am     	 Transmission (0 = automatic, 1 = manual)",
        "[,10]	      gear     	 Number of forward gears",
        "[,11]	      carb     	 Number of carburetors"))

mtcars

#create new subset of mtcars called new data which only shows the automatic transmission
newdata <- mtcars[ which(mtcars$am  == 0),]

newdata                 


#3.  saves this new subset as a new file called "automatic_mtcars.csv" in your Assignment_5 directory
write.csv(newdata,'../../../Data_Course_Money/Assignments/Assignment_6/automatic_mtcars.csv')


#4.  plots the effect of horsepower on miles-per-gallon (update plot to have meaningful labels and title)
cor(mtcars$hp, mtcars$mpg)


plot(hp~mpg, data = mtcars, ylab = "Miles per Gallon", xlab = "Horsepower", 
     main = "Effect of horsepower on MPG ") 

##OR 

qplot(hp, mpg, data = mtcars, colour = hp, geom = "point",     
      ylab = "Miles per Gallon", xlab = "Horsepower",
      main = "Impact of Horsepower on MPG")     


#5.  saves this plot as a png image called "mpg_vs_hp_auto.png" in your Assignment_5 directory


png(filename = "../../../Data_Course_Money/Assignments/Assignment_6/mpg_vs_hp_auto.png")

plot(hp~mpg, data = mtcars, ylab = "Miles per Gallon", xlab = "Horsepower", 
     main = "Effect of horsepower on MPG ") 

dev.off()


png(filename = "../../../Data_Course_Money/Assignments/Assignment_6/mpg_vs_hp_auto2.png")

qplot(hp, mpg, data = mtcars, colour = hp, geom = "point",     
      ylab = "Miles per Gallon", xlab = "Horsepower",
      main = "Impact of Horsepower on MPG")     


dev.off()




#6.  plots the effect of weight on miles-per-gallon (with improved labels, again)
 
plot(wt ~mpg, data = mtcars, ylab = "Miles per Gallon", xlab = "Weight", 
     main = "Effect of Weight on MPG ") 

##OR 

qplot(wt, mpg, data = mtcars, colour = wt, geom = "point",     
      ylab = "Miles per Gallon", xlab = "Weight",
      main = "Impact of Weight on MPG")     
 
#7.  saves this second plot as a **tiff** image called "mpg_vs_wt_auto.tiff" in your Assignment_5 directory

tiff(filename = "../../../Data_Course_Money/Assignments/Assignment_6/mpg_vs_wt_auto.tiff")

plot(wt ~mpg, data = mtcars, ylab = "Miles per Gallon", xlab = "Weight", 
     main = "Effect of Weight on MPG ") 

dev.off()


#OR

tiff(filename = "../../../Data_Course_Money/Assignments/Assignment_6/mpg_vs_wt_auto2.tiff")

qplot(wt, mpg, data = mtcars, colour = wt, geom = "point",     
      ylab = "Miles per Gallon", xlab = "Weight",
      main = "Impact of Weight on MPG")     

dev.off()





 
 
#8.  subsets the original mtcars dataframe to include only cars with displacements less than or equal to 200 cu.in.


max200 <- mtcars[which(mtcars$disp <= 200),]
max200


 
 
#9.  saves that new subset as a csv file called mtcars_max200_displ.csv

write.csv(max200,'../../../Data_Course_Money/Assignments/Assignment_6/mtcars_max200.csv')

 
 
#10. includes code to calculate the maximum horsepower for each of the three dataframes (original, automatic, max200)


#max horsepower in mtcars, max200, newdata
#gives maximum of all three dataframes = 335
maxMaxHorsepower <- max(mtcars$hp, newdata$hp, max200$hp)


#gives maximum of individual dataframes
maxMT <-max(mtcars$hp)
maxNew <- max(newdata$hp)
maxMax<-max(max200$hp)

AllMax <- c(maxMT,maxNew,maxMax)
AllMax

#can't combine bc different # of rows
Alldf <- data.frame(mtcars,newdata,max200) 

##merged three dataframes
mergedf <-merge(df, merge(newdata, max200, by="mpg", all.x=TRUE, all.y=TRUE), by = "mpg", all.x = TRUE, all.y = TRUE)

mergedf
#max of merged dataframes
maxhp <- max(mergedf$hp)

maxhp #335

write.csv(AllMax, "../../../Data_Course_Money/Assignments/Assignment_6/hp_maximums.txt")

#11. prints these calculations (from task 10) in a readable format to a new plaintext file called hp_maximums.txt








