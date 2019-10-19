# Write a script that:
# 1.  loads the "/Data/mushroom_growth.csv" data set
df<-read.csv("../Data_Course/Data/mushroom_growth.csv")
glimpse(df)




# 2.  creates several plots exploring relationships between the response and predictors

mod1 = lm(Light ~ GrowthRate, data = df)
summary(mod1)


plot(df$Light ~ df$GrowthRate)
abline(mod1)


####
mod2 = lm( Nitrogen ~ GrowthRate, data = df)
summary(mod2)

plot(df$Nitrogen ~ df$GrowthRate)
abline(mod2)

mod3 = lm(GrowthRate ~ Temperature, data = df)
summary(mod3)

plot(df$GrowthRate ~ df$Temperature)
abline(mod3)



# 3.  defines at least 2 models that explain the **dependent variable "GrowthRate"**
#   + One must be a lm() and 
# + one must be an aov()

mod2 = lm( Nitrogen ~ GrowthRate, data = df)
plot(df$Nitrogen ~ df$GrowthRate)
abline(mod2, col = "Red")

mod4 = aov( Temperature ~ GrowthRate, data = df)
plot(df$Temperature ~ df$GrowthRate)
abline(mod4, col = "Blue")




# 4.  calculates the mean sq. error of each model

residuals(mod2)
mean(residuals(mod1)^2)
mean(residuals(mod2)^2)
mean(residuals(mod3)^2)
mean(residuals(mod4)^2) ##





# 5.  selects the best model you tried

mod4 


# 6.  adds predictions based on new values for the independent variables used in your model

preds <- add_predictions(df, mod4)
preds
 preds1 <- add_predictions(df, mod1)
preds1

# 7.  plots these predictions alongside the real data

{plot(mtcars$mpg ~ mtcars$disp,xlim=c(0,1000),ylim=c(-10,50))
  points(x=newdf$disp,y=predictions, col="Red")
  abline(mod1)}

{plot(df$Temperature ~ df$GrowthRate)
  points(x=preds$Temperature, y= preds$pred, col="Red")
  abline(mod4)
}

{plot(df$Light ~ df$GrowthRate)
  points(x=preds$Light, y= preds1$pred, col="Red")
  abline(mod1)
}


# + Upload responses to the following as a numbered plaintext document to Canvas:
#   1.  Are any of your predicted response values from your best model scientifically meaningless? Explain.


# 2.  In your plots, did you find any non-linear relationships? 
#   If so, do a bit of research online and give a link to at least one resource explaining how to deal with this in R
#https://www.r-bloggers.com/first-steps-with-non-linear-regression-in-r/